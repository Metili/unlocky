import 'package:flutter/material.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/screens/Cadenas.dart';
import 'package:unlocky/screens/Home.dart';
import 'package:unlocky/screens/Locaux.dart';
import 'package:unlocky/screens/Settings.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentPageIndex = 0;

  List<Widget> destinations = [
    const NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Accueil',
    ),
    const NavigationDestination(
      icon: Icon(Icons.location_pin),
      label: 'Locaux',
    ),
    const NavigationDestination(
      icon: Icon(Icons.lock),
      label: 'Cadenas',
    ),
    const NavigationDestination(
      icon: Icon(Icons.settings),
      label: 'Parametre',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: <Widget>[
        /// Home page
        Home(theme: theme),

        /// Loacaux page
        Loacaux(theme: theme),

        /// Cadenas page
        Cadenas(theme: theme),

        /// Settings
        Settings(theme: theme)
      ][currentPageIndex],

      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: primary,
          selectedIndex: currentPageIndex,
          destinations: destinations),
    );
  }
}
