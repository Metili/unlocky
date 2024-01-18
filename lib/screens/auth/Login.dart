import 'package:flutter/material.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? _email = '';
    String? _password = '';

    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(image: AssetImage('assets/images/logo.png')),
          ]),
          TitleU(
              title: "CONNECTEZ-VOUS", size: pageTitle, textColor: secondary),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* email input */
                      const Text(
                        "Email",
                        style: TextStyle(color: secondary, fontSize: normal),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(inputRadius),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(backgroundColor: white),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Entrez votre adresse mail',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: normal,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ce champ est requis !';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /* password input */
                      const Text(
                        "Mot de passe",
                        style: TextStyle(color: secondary, fontSize: normal),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(inputRadius),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(backgroundColor: white),
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '**********',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: normal,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ce champ est requis !';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primary,
                      padding: const EdgeInsets.symmetric(horizontal: 100)
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        print('Name: $_email');
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
// ignore: must_be_immutable
// class Login extends StatelessWidget {
//   const Login({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     String _email = '';
//     String _password = '';

//     return Scaffold(
//       backgroundColor: white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Image(image: AssetImage('assets/images/logo.png')),
//           ]),
//           TitleU(title: "CONNECTEZ-VOUS", size: pageTitle, textColor: secondary)
//         ],
//       ),
//     );
//   }
// }
