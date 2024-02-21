import 'package:flutter/material.dart';
import 'package:unlocky/components/components.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: non_constant_identifier_names
Widget SearchAdd({context, placeholder, onChange, addLink}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 285,
        margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: TextField(
          decoration: CinputDecoration(
              placeholder: placeholder, icon: const Icon(Icons.search)),
          onChanged: onChange,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
        height: 50,
        width: 53,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: ColorsU.primary),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, addLink);
          },
          icon: const Icon(
            Icons.add,
            size: iconSize,
          ),
          color: ColorsU.white,
        ),
      )
    ],
  );
}
