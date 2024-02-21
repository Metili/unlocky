import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';
import 'package:unlocky/models/User.dart';
import 'package:unlocky/screens/auth/Login.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  final bool? implyLeading;
  const Settings({super.key, this.implyLeading});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  User? data;
  final _picker = ImagePicker();
  File? _imageFile;
  int? id;
  String? token = '';

  Future<void> refresh() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // data = User.fromJson(pref.getStringList("user") as Map<String, dynamic>);

    token = pref.getString("token");

    // print("user infos ==> ${pref.getStringList("user")?.toList() }");

    await Future.delayed(const Duration(milliseconds: 2));
    if (token != '') {
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future getImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      File? img = File(pickedFile.path);
      setState(() {
        _imageFile = img;
      });
    } on PlatformException catch (e) {
      print("Error picker $e");
    }
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: widget.implyLeading ?? false,
        title: TitleU(
          title: "Paramètres".toUpperCase(),
          size: pageTitle,
          textColor: ColorsU.secondary,
        ),
        shadowColor: Colors.white,
        elevation: 4.0,
        backgroundColor: ColorsU.whiteSmoke,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  imageProfile(),
                  const SizedBox(width: 10.0,),
                  token != null
                      ? Text(
                          data != null ? '' : 'Furel Teguimene',
                          style: Theme.of(context).textTheme.titleMedium!.merge(
                                const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 25),
                              ),
                              overflow: TextOverflow.ellipsis,
                        )
                      : Container(
                          // width: double.infinity / 2,
                          child: ElevatedButton(
                            child: Text(
                              'Se Connecter',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const Login()));
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                      left: 15,
                                      right: 15)),
                              backgroundColor:
                                  MaterialStateProperty.all(ColorsU.primary),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            const Divider(
              height: 12.0,
              color: ColorsU.grey,
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.help_outline_rounded,
                    color: Colors.black,
                  ),
                  title: const Text('Centre d\'aide'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text('Déconnexion', style: TextStyle(color: Colors.red),),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Container(
      child: IconButton(
        onPressed: () {
          getImage();
        },
        icon: _imageFile == null
            ? Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 30,
              )
            : Icon(
                Icons.person_rounded,
                color: Colors.transparent,
                size: 30,
              ),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(50),
        image: _imageFile == null
            ? null
            : DecorationImage(
                image: FileImage(_imageFile ?? File('')), fit: BoxFit.cover),
      ),
    );
  }
}
