import 'package:flutter/material.dart';
import 'package:unlocky/screens/auth/Login.dart';

// ignore: must_be_immutable
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Login in !'))
      ],
    );
  }
}
