import 'dart:typed_data';

import 'package:flutter/material.dart';

class ScreenshotProvider with ChangeNotifier {
  Uint8List? _screenshot;

  Uint8List? get screenshot => _screenshot;

  void setScreenshot(Uint8List screenshot) {
    _screenshot = screenshot;
    notifyListeners();
  }
}
