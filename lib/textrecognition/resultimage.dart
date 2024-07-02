import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:sight_poject/provider/screenshot_provider.dart';
import 'package:sight_poject/textrecognition/resultface.dart';
import 'package:sight_poject/textrecognition/resulttext.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

class ResultImage extends StatefulWidget {
  const ResultImage({Key? key}) : super(key: key);

  @override
  State<ResultImage> createState() => _ResultImageState();
}

class _ResultImageState extends State<ResultImage> {
  String _recognizedText = '';
  final TextRecognizer _textRecognizer = TextRecognizer();
  final String luxandToken =
      '0d5386591c22477fa88518de84a5866e'; // Replace with your Luxand token

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _command = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _listen();
  }

  Future<void> _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) {
          print('onError: $val');
          _listen();
        },
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _command = val.recognizedWords;
            _handleVoiceCommand(_command);
          }),
          listenOptions: stt.SpeechListenOptions(
            listenMode: stt.ListenMode.dictation,
          ),
        );
      }
    } else {
      _speech.listen(
        onResult: (val) => setState(() {
          _command = val.recognizedWords;
          _handleVoiceCommand(_command);
        }),
      );
    }
  }

  void _handleVoiceCommand(String command) async {
    final imageBytes =
        Provider.of<ScreenshotProvider>(context, listen: false).screenshot;
    if (imageBytes == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No image to process')));
      return;
    }

    if (command.contains('detect')) {
      final imageBytes =
          Provider.of<ScreenshotProvider>(context, listen: false).screenshot;
      if (imageBytes != null) {
        await _recognizeFaces(imageBytes);
        _listen();
      }
    } else if (command.contains('register')) {
      final name = await _getNameFromUser();
      if (name != null && name.isNotEmpty) {
        await _enrollPerson(imageBytes, name);
      }
      _listen();
    } else if (command.contains('extract text')) {
      await _recognizeTextFromImage(imageBytes);
      _listen();
    } else if (command.contains('return')) {}
    _listen();
  }

  Future<File> _convertUint8ListToFile(Uint8List imageBytes) async {
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(imageBytes);
    return file;
  }

  Future<void> _recognizeTextFromImage(Uint8List imageBytes) async {
    try {
      final directory = await getTemporaryDirectory();
      final imageFile = File('${directory.path}/screenshot.jpg');
      await imageFile.writeAsBytes(imageBytes);
      final inputImage = InputImage.fromFile(imageFile);

      final RecognizedText recognisedText =
          await _textRecognizer.processImage(inputImage);

      setState(() {
        _recognizedText = recognisedText.text;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(text: _recognizedText),
        ),
      );
    } catch (e) {
      print('Error recognizing text: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to recognize text from image')),
      );
    }
  }

  Future<void> _enrollPerson(Uint8List imageBytes, String name) async {
    final file = await _convertUint8ListToFile(imageBytes);
    final url = 'https://api.luxand.cloud/v2/person';

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers['token'] = luxandToken
      ..files.add(await http.MultipartFile.fromPath('photos', file.path))
      ..fields['name'] = name;

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Upload successful!');
      final responseData = await response.stream.bytesToString();
      print(responseData);
    } else {
      print('Upload failed with status: ${response.statusCode}');
      final responseData = await response.stream.bytesToString();
      print('Error details: $responseData');
    }
  }

  Future<void> _recognizeFaces(Uint8List imageBytes) async {
    final file = await _convertUint8ListToFile(imageBytes);
    final url = 'https://api.luxand.cloud/photo/search/v2';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers['token'] = luxandToken
        ..files.add(await http.MultipartFile.fromPath('photo', file.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final data = json.decode(responseData);
        print('Recognize response data: $data');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Resultface(imagePath: file.path, faces: data),
          ),
        );
      } else {
        throw Exception('Failed to recognize faces');
      }
    } catch (e) {
      print('Error recognizing faces: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to recognize faces')),
      );
    }
  }

  Future<String?> _getNameFromUser() async {
    String? name;
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register Face'),
          content: TextField(
            onChanged: (value) {
              name = value;
            },
            decoration: InputDecoration(hintText: "Enter name"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(name);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    return name;
  }

  @override
  void dispose() {
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Result Image'),
        actions: [],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.memory(
                context.watch<ScreenshotProvider>().screenshot!,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final imageBytes =
                      Provider.of<ScreenshotProvider>(context, listen: false)
                          .screenshot;
                  if (imageBytes != null) {
                    await _recognizeTextFromImage(imageBytes);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No image to process')),
                    );
                  }
                },
                child: Text(
                  'Extract Text',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff8EB870),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final imageBytes =
                      Provider.of<ScreenshotProvider>(context, listen: false)
                          .screenshot;
                  if (imageBytes != null) {
                    final name = await _getNameFromUser();
                    if (name != null && name.isNotEmpty) {
                      await _enrollPerson(imageBytes, name);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No image to process')),
                    );
                  }
                },
                child: Text(
                  'register Person',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff8EB870),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final imageBytes =
                      Provider.of<ScreenshotProvider>(context, listen: false)
                          .screenshot;
                  if (imageBytes != null) {
                    await _recognizeFaces(imageBytes);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No image to process')),
                    );
                  }
                },
                child: Text(
                  'Recognize Faces',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff8EB870),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
