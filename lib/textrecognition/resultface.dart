import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sight_poject/provider/screenshot_provider.dart';

class Resultface extends StatelessWidget {
  final String imagePath;
  final List<dynamic> faces;
  final String luxandToken =
      '0d5386591c22477fa88518de84a5866e'; // Replace with your Luxand token

  Resultface({required this.imagePath, required this.faces});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Faces detected: ${faces.length}',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          for (var face in faces) _buildFaceInfo(face),
          Container(
            child: Image.memory(
              context.watch<ScreenshotProvider>().screenshot!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaceInfo(dynamic face) {
    return Column(
      children: [
        Text('Name: ${face['name']}'),
        face['url'] != null ? Image.network(face['url']) : Container(),
      ],
    );
  }

  Future<String> _getFaceName(dynamic face) async {
    try {
      final url = 'https://api.luxand.cloud/photo/search/v2';
      final file = File(imagePath);

      final request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers['token'] = luxandToken
        ..files.add(await http.MultipartFile.fromPath('photo', file.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final data = json.decode(responseData);
        if (data.isNotEmpty && data[0]['probability'] > 0.75) {
          return data[0]['name'];
        }
      }
    } catch (e) {
      print('Error getting face name: $e');
    }

    return 'Unknown';
  }

  Future<File> _convertUint8ListToFile(Uint8List imageBytes) async {
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(imageBytes);
    return file;
  }
}
