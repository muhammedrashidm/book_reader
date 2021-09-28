// ignore_for_file: file_names

import 'package:book_reader/ml_Package/google_ml_imp.dart';
import 'package:book_reader/playback_Package/playbackPackage.dart';
import 'package:book_reader/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class FloatingMenuBar extends StatefulWidget {
  const FloatingMenuBar(
      {Key? key,
      required this.playText,
      required this.stopText,
      required this.speedUpText,
      required this.clearText})
      : super(key: key);
  final Function playText;
  final Function stopText;
  final Function speedUpText;
  final Function clearText;
  @override
  State<FloatingMenuBar> createState() => _FloatingMenuBarState();
}

class _FloatingMenuBarState extends State<FloatingMenuBar> {
  GoogleMl googleMl = GoogleMl();

  var textPlayer = TextPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25.0, left: 10, right: 10),
          child: Container(
            padding: EdgeInsets.all(5.0),
            height: 60.0,
            decoration: const BoxDecoration(
                color: Color(0xff11052C),
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.playText();
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.play_arrow,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.speed_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 1.0,
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.stopText();
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.pause,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.clearText;
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.clear_all,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
