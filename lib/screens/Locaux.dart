import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loacaux extends StatelessWidget {
  Loacaux({super.key, required this.theme});

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Locaux page',
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
