import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unlocky/api/command.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/components/components.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/logos.dart';
import 'package:unlocky/constains/sizes.dart';
import 'package:unlocky/constains/text.dart';
import 'package:http/http.dart' as http;
import 'package:unlocky/main.dart';
import 'dart:convert';

import 'package:unlocky/screens/auth/Register.dart';
import 'package:unlocky/utils/functions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    handleLoging() async {
      try {
        //On fait des essais sur les reponses que va nous renvoyer la requete post
        http.Response response = await CallApi()
            .login(emailController.text, passwordController.text);
        // ignore: use_build_context_synchronously
        checkResponse(
            context: context,
            body: response.body,
            status: response.statusCode,
            isLoggin: true);
      } catch (e) {
        // ignore: use_build_context_synchronously
        return errorSnackBar(context, constText.serviceError);
      }
    }

    return Scaffold(
      backgroundColor: ColorsU.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(image: AssetImage(Logo.mainLogo)),
            ]),
            TitleU(
                title: "CONNECTEZ-VOUS", size: pageTitle, textColor: ColorsU.secondary),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // Email input
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Email",
                              style:
                                  TextStyle(color: ColorsU.secondary, fontSize: normal),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                  color: Colors.red, fontSize: normal),
                            ),
                          ],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (val) =>
                              val!.isEmpty ? constText.requiredText : null,
                          decoration: CinputDecoration(
                              placeholder: 'Entrez votre adresse mail'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /* password */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Mot de passe",
                              style:
                                  TextStyle(color: ColorsU.secondary, fontSize: normal),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                  color: Colors.red, fontSize: normal),
                            ),
                          ],
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          validator: (val) => val!.length < 6
                              ? constText.paswordConstraints
                              : null,
                          decoration:
                              CinputDecoration(placeholder: '************'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CElevatedButton(
                      "Se connecter",
                      () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          handleLoging();
                        }
                      },
                      const EdgeInsets.symmetric(horizontal: 100),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                             Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              "Pas de compte? Enregistrez-vous",
                              style: TextStyle(
                                  color: ColorsU.secondary,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
