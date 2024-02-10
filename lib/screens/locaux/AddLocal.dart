import 'package:flutter/material.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/components/components.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';
import 'package:unlocky/constains/text.dart';
import 'package:unlocky/screens/auth/Login.dart';

class AddLocal extends StatefulWidget {
  const AddLocal({super.key});

  @override
  State<AddLocal> createState() => _AddLocalState();
}

class _AddLocalState extends State<AddLocal> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    handleAddLocal() {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const Welcome()),
      // );
    }

    return Scaffold(
      backgroundColor: ColorsU.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(image: AssetImage('assets/images/logo.png')),
            ]),
            TitleU(
                title: "AJOUTER UN LOCAL", size: pageTitle, textColor: ColorsU.secondary),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    /* name input */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Nom du local",
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
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          validator: (val) =>
                              val!.isEmpty ? constText.requiredText : null,
                          decoration: CinputDecoration(
                              placeholder: "Entrez le nom du local"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /* ville input */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Ville",
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
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          validator: (val) =>
                              val!.isEmpty ? constText.requiredText : null,
                          decoration:
                              CinputDecoration(placeholder: "Votre ville"),
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
                              placeholder: "Entrez l'adresse mail du local"),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    CElevatedButton(
                      "Sauvegarder",
                      () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          handleAddLocal();
                        }
                      },
                      const EdgeInsets.symmetric(horizontal: 100),
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
