import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: non_constant_identifier_names
InputDecoration CinputDecoration({placeholder}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(10.0),
    border: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: secondary,
        ),
        borderRadius: BorderRadius.circular(10)),
    hintText: placeholder,
    hintStyle: const TextStyle(
      color: grey,
      fontSize: normal,
    ),
  );
}

/* button */
// ignore: non_constant_identifier_names
ElevatedButton CElevatedButton(
    String label, Function onPressed, EdgeInsets padding) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        foregroundColor: white, backgroundColor: primary, padding: padding),
    onPressed: () => onPressed(),
    child: Text(
      label,
      style: const TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: normal,
      ),
    ),
  );
}

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    duration: const Duration(seconds: 2),
  ));
}

succesSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green[400],
    content: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    duration: const Duration(seconds: 2),
  ));
}
