import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:sight_poject/provider/screenshot_provider.dart';
import 'package:sight_poject/textrecognition/resultimage.dart'; // Make sure to create and import this file

class ScreenshotPage extends StatefulWidget {
  @override
  _ScreenshotPageState createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  ScreenshotController screenshotController = ScreenshotController();
  bool isRunning = true;
  late MqttServerClient client;
  @override
  void initState() {
    super.initState();
    setupMqttClient();
  }

  void _takeScreenshot() async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    screenshotController.capture().then((image) async {
      if (image != null) {
        // Save image to local storage
        final file = File('$directory/screenshot.png');
        await file.writeAsBytes(image);

        // Get dimensions of the screenshot
        final Image imageInstance = Image.memory(image);
        final Completer<ui.Image> completer = Completer<ui.Image>();
        imageInstance.image
            .resolve(const ImageConfiguration())
            .addListener(ImageStreamListener((ImageInfo info, bool _) {
          completer.complete(info.image);
        }));
        final ui.Image dimensions = await completer.future;
        final int width = dimensions.width;
        final int height = dimensions.height;

        // Save image in provider
        Provider.of<ScreenshotProvider>(context, listen: false)
            .setScreenshot(image);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultImage(),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Screenshot saved to $directory and in provider. Dimensions: $width x $height pixels',
            ),
          ),
        );
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  var isrunning = true;

  @override
  Widget build(BuildContext context) {
    final screenshot = Provider.of<ScreenshotProvider>(context);

    return Consumer<ScreenshotProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Screenshot Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Screenshot(
                  controller: screenshotController,
                  child: Mjpeg(
                    isLive: isRunning,
                    stream: 'http://192.168.210.94:81/stream',
                  ),
                ),
                // Image.asset(
                //   "assets/faces.png",
                // ),

                ElevatedButton(
                  onPressed: _takeScreenshot,
                  child: Text(
                    'Take Screenshot',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Color(
                        0xff8EB870,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> setupMqttClient() async {
    client = MqttServerClient('broker.emqx.io', '');
    client.port = 1883;
    client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.logging(on: true);

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('FlutterClient')
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      if (pt == 'capture') {
        print('Capture signal received');
        _takeScreenshot();
        // Trigger the capture button action here
      }
    });
  }

  void onConnected() {
    print('Connected to MQTT broker');
    client.subscribe('esp32/cam/capture', MqttQos.atMostOnce);
  }

  void onDisconnected() {
    print('Disconnected from MQTT broker');
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }
}
