import 'package:flutter/material.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/components/components.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';
import 'package:unlocky/constains/text.dart';
import 'package:unlocky/screens/auth/Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repassController = TextEditingController();

    handleRegister() {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const Welcome()),
      // );
    }

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(image: AssetImage('assets/images/logo.png')),
            ]),
            TitleU(
                title: "INSCRIVEZ-VOUS", size: pageTitle, textColor: secondary),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    /* username input */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Username",
                              style:
                                  TextStyle(color: secondary, fontSize: normal),
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
                          keyboardType: TextInputType.text,
                          controller: usernameController,
                          validator: (val) =>
                              val!.isEmpty ? constText.requiredText : null,
                          decoration: CinputDecoration(
                              placeholder: "Entrez votre nom d'utilisateur"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Email input
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Email",
                              style:
                                  TextStyle(color: secondary, fontSize: normal),
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
                                  TextStyle(color: secondary, fontSize: normal),
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
                      height: 10,
                    ),
                    /* confirm password */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Confirmer le mot de passe",
                              style:
                                  TextStyle(color: secondary, fontSize: normal),
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
                          controller: repassController,
                          validator: (val) =>
                              repassController.text != passwordController.text
                                  ? constText.samePassError
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
                      "S'inscrire",
                      () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          handleRegister();
                        }
                      },
                      const EdgeInsets.symmetric(horizontal: 100),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                  (route) => false);
                            },
                            child: const Text(
                              "Pas de compte? Enregistrez-vous",
                              style: TextStyle(
                                  color: secondary,
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
