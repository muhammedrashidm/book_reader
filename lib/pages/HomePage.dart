// ignore_for_file: file_names

import 'dart:io';

import 'package:book_reader/ml_Package/google_ml_imp.dart';
import 'package:book_reader/playback_Package/playbackPackage.dart';
import 'package:book_reader/widgets/FloatingMenuBar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:video_player/video_player.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CameraController _controller;
  bool isLive = true;
  late String image;
  GoogleMl googleMl = GoogleMl();
  TextPlayer textPlayer = TextPlayer();
  double speachRate = 1.0;

  late String text = '';
  // final inputImage = InputImage.fromFilePath(image);
  void _initializeCamera() async {
    final CameraController cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    _controller = cameraController;

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future<String?> _takePicture() async {
    if (!_controller.value.isInitialized) {
      print("Controller is not initialized");
      return null;
    }

    String? imagePath;

    if (_controller.value.isTakingPicture) {
      print("Processing is in progress...");
      return null;
    }

    try {
      // Turning off the camera flash
      _controller.setFlashMode(FlashMode.off);
      // Returns the image in cross-platform file abstraction
      final XFile file = await _controller.takePicture();

      // Retrieving the path
      imagePath = file.path;
    } on CameraException catch (e) {
      print("Camera Exception: $e");
      return null;
    }
    print(imagePath.toString());
    return imagePath;
  }

  clearEverything() {
    setState(() {
      text = '';
      image = '';
      isLive = true;
      textPlayer.stop();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _initializeCamera();

    super.initState();
  }

  late final VideoPlayerController? localVideoController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: isLive == true
                ? CameraPreview(_controller)
                : Image.file(File(image)),
          ),
          Container(
            child: FloatingMenuBar(
              clearText: () {
                clearEverything();
              },
              speedUpText: () {
                textPlayer.setSpeechRate(speachRate).then((value) {
                  setState(() {
                    speachRate = value;
                  });
                });
              },
              playText: () {
                textPlayer.speak(text);
              },
              stopText: () {
                textPlayer.stop();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Container(
            padding: EdgeInsets.all(5.0),
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: Container(
              child: FloatingActionButton(
                  backgroundColor: Color(0xff11052C),
                  child: const Icon(
                    Icons.camera,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _takePicture().then((value) async {
                      setState(() {
                        isLive = false;
                        image = value.toString();
                      });
                      await googleMl
                          .processImage(InputImage.fromFilePath(image))
                          .then((value) {
                        setState(() {
                          text = value.toString();
                        });
                      });
                    });
                  }),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
