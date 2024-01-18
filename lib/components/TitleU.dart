import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleU extends StatelessWidget {
  TitleU(
      {super.key,
      required this.title,
      required this.size,
      required this.textColor});

  String title;
  double size;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor, fontSize: size, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
