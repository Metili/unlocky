import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cadenas extends StatelessWidget {
  Cadenas({super.key, required this.theme, required String data, required bool implyLeading});

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cadenas page',
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
