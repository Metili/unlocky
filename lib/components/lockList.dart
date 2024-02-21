import 'package:flutter/material.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: non_constant_identifier_names
Widget LockList({isFree, leftIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: GestureDetector(
      onTap: () => {
        // Navigator.pushNamed(context, '/locks')
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isFree ? ColorsU.listCadColors : ColorsU.lockNotFree),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  leftIcon,
                  size: iconSize,
                  color: isFree ? ColorsU.secondary : ColorsU.white,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Mon cadenas",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: isFree ? ColorsU.secondary : ColorsU.white, fontSize: 18),
                )
              ],
            ),
            IconButton(
              onPressed: () {
                print("go to cdenas details");
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: iconSize,
              ),
              color: ColorsU.secondary,
            ),
          ],
        ),
      ),
    ),
  );
}
