import 'package:flutter/material.dart';
import 'package:unlocky/screens/auth/Login.dart';

// ignore: must_be_immutable
class Settings extends StatelessWidget {
  Settings({super.key, required this.theme});

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text('Login in !'))
      ],
    );
  }
}
