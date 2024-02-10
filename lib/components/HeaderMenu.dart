import 'package:flutter/material.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: non_constant_identifier_names
Widget HeaderMenu({title}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes the position of the shadow
        ),
      ],
    ),
    child: AppBar(
      title: title,
      centerTitle: true,
    ),
  );
}
