import 'package:flutter/cupertino.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class GoogleMl {
  final textDetector = GoogleMlKit.vision.textDetector();
  Future<String> processImage(InputImage inputImage) async {
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);
    // final result = await Vision.channel.invokeMethod('vision#startTextDetector',
    //     <String, dynamic>{'imageData': inputImage._getImageData()});

    // final recognisedText = RecognisedText.fromMap(result);
    String text = recognisedText.text;

    for (TextBlock block in recognisedText.blocks) {
      final Rect rect = block.rect;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }

    return text;
  }
}
