import 'package:flutter/material.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: must_be_immutable
class Locaux extends StatelessWidget {
  const Locaux({super.key});

  @override
  Widget build(BuildContext context) {
    String? routeName = ModalRoute.of(context)!.settings.name;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: iconHomeSize,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Locaux page ${routeName}',
        ),
      ),
    );
  }
}
