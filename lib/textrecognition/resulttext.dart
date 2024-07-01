import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultPage extends StatefulWidget {
  final String text;

  ResultPage({required this.text});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    String displayText = widget.text
        .replaceAll("Press the button to capture screenshot", "")
        .replaceAll("Take Screenshot", "")
        .replaceAll("screenshot taken", "");
    // TODO: implement initState
    super.initState();
    speak(displayText.trim());
  }

  @override
  Widget build(BuildContext context) {
    // Process the text to remove unwanted phrases
    String displayText = widget.text
        .replaceAll("Press the button to capture screenshot", "")
        .replaceAll("Take Screenshot", "")
        .replaceAll("screenshot taken", "");

    return Scaffold(
      appBar: AppBar(
        title: Text('Recognized Text'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(displayText.trim()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> speak(String text) async {
    if (text.isEmpty) {
      print("No valid text to speak.");
    } else {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);
    }
  }
}
