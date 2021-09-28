// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onPressed(),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              color: Color(0xffffffff), shape: BoxShape.circle),
          child: Icon(icon),
        ),
      ),
    );
  }
}
