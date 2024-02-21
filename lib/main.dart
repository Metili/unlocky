import 'package:flutter/material.dart';
import 'package:unlocky/components/DrawerU.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/screens/Cadenas.dart';
import 'package:unlocky/screens/Home.dart';
import 'package:unlocky/screens/SplashScreen.dart';
import 'package:unlocky/screens/auth/Login.dart';
import 'package:unlocky/screens/auth/Register.dart';
import 'package:unlocky/screens/locaux/AddLocal.dart';
import 'package:unlocky/screens/locaux/Locaux.dart';
import 'package:unlocky/screens/Settings.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const SplashScreen(),
        '/welcome': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/locations/add': (context) => const AddLocal(),
        '/locations': (context) => const Locaux(),
        '/locks': (context) => const Cadenas(),
        '/settings': (context) => const Settings(),
      },
      initialRoute: '/home',
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
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
      enabled: true,
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

  final screens = [
    const Home(),
    const Locaux(),
    const Cadenas(),
    const Settings()
  ];
  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentPageIndex],
      drawer: DrawerU(context: context),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: ColorsU.primary,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        child: NavigationBar(
          height: 70,
          backgroundColor: ColorsU.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentPageIndex,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (currentIndex) =>
              setState(() => currentPageIndex = currentIndex),
          destinations: destinations,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
