import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/logos.dart';
import 'package:unlocky/constains/sizes.dart';
import 'package:unlocky/main.dart';
import 'package:unlocky/screens/auth/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void load() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    print("token ==> ${token}");
    if (token != null) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/welcome'),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/login'),
      );
    }
    // else {
    //   ApiResponsive response = await getUserDetail();
    //   if(response.error == null) {
    //     Timer(
    //       Duration(seconds: 3),
    //       ()=>Navigator.of(context).pushAndRemoveUntil(
    //         MaterialPageRoute(builder: (context) => IndexProd()), (route) => false),
    //     );
    //   } else if (response.error == "unauthorized") {
    //     Timer(
    //       Duration(seconds: 3),
    //       ()=>Navigator.of(context).pushAndRemoveUntil(
    //         MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false),
    //     );
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text('${response.error}'),
    //     ));
    //   }
    // }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Logo.mainLogo,
                      width: 700.0,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const CircularProgressIndicator(
                      color: primary,
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bienvenue sur Intelligent Unl",
                    style: TextStyle(
                        color: secondary,
                        fontSize: h2,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.lock,
                    size: 20,
                  ),
                  Text(
                    "ck",
                    style: TextStyle(
                        color: secondary,
                        fontSize: h2,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Text('Votre application de dévérouillage à distance.'),
            ],
          ),
        ),
      ),
    );
  }
}
