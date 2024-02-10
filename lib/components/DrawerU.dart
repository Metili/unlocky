import 'package:flutter/material.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/logos.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: non_constant_identifier_names
Widget DrawerU({context}) {
  String? routeName = ModalRoute.of(context)!.settings.name;
  
  return Drawer(
    backgroundColor: ColorsU.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Logo.mainLogo),
                height: 80.0,
              ),
              Text(
                "Intelligent",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37531A)),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Unlock",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Divider(
          height: 2.0,
          color: ColorsU.grey,
        ),
        const SizedBox(
          height: 5.0,
        ),
        ListTile(
          leading: const Icon(Icons.home),
          iconColor: ColorsU.secondary,
          tileColor: ColorsU.primary,
          title: Text(
            'Accueil',
            style: TextStyle(
                color: routeName == "/welcome" ? ColorsU.secondary : null,
                fontWeight: FontWeight.bold,
                fontSize: normal),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/welcome');
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_pin),
          iconColor: ColorsU.secondary,
          title: Text(
            'Locaux',
            style: TextStyle(
                color: routeName == "/location" ? ColorsU.secondary : null,
                fontWeight: FontWeight.bold,
                fontSize: normal),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/location');
          },
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          iconColor: ColorsU.secondary,
          title: Text(
            'Cadenas',
            style: TextStyle(
                color: routeName == "/lock" ? ColorsU.secondary : null,
                fontWeight: FontWeight.bold,
                fontSize: normal),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/lock');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          iconColor: ColorsU.secondary,
          title: Text(
            'Parametre',
            style: TextStyle(
                color: routeName == "/settings" ? ColorsU.secondary : null,
                fontWeight: FontWeight.bold,
                fontSize: normal),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    ),
  );
}
