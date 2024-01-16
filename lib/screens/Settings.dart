import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Settings extends StatelessWidget {
  Settings({super.key, required this.theme});

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings page',
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
