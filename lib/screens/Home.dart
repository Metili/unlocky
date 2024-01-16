import 'package:flutter/material.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key, required this.theme});

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset:
                    const Offset(0, 3), // changes the position of the shadow
              ),
            ],
          ),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                size: iconHomeSize,
              ),
              onPressed: () {
                // Action à effectuer lorsque l'icône est pressée
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: iconHomeSize,
                ),
                onPressed: () {
                  // Action à effectuer lorsque l'icône est pressée
                },
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Home page',
            style: theme.textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
