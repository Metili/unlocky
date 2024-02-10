import 'package:flutter/material.dart';
import 'package:unlocky/components/HeaderMenu.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/components/components.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

class Locaux extends StatefulWidget {
  const Locaux({super.key});

  @override
  State<Locaux> createState() => _LocauxState();
}

class _LocauxState extends State<Locaux> {
  @override
  Widget build(BuildContext context) {
    String? routeName = ModalRoute.of(context)!.settings.name;
    String searchQuery = '';
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HeaderMenu(
          title: TitleU(
              title: "Locaux", size: pageTitle, textColor: ColorsU.secondary)),
      Container(
        margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 285,
                  margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: TextField(
                    decoration: CinputDecoration(
                        placeholder: "Rechercher un local...",
                        icon: const Icon(Icons.search)),
                    onChanged: (String value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                  height: 50,
                  width: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorsU.primary),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/locations/add');
                      },
                      icon: const Icon(Icons.add, size: iconSize,),
                      color: ColorsU.white,),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Voir plus",
                  style: TextStyle(
                      fontSize: normal,
                      color: ColorsU.primary,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      print("voir plus !");
                    },
                    icon: const Icon(Icons.arrow_forward))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsU.listCadColors),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "10",
                        style: TextStyle(
                            fontSize: valueList, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Serrure(s)",
                        style: TextStyle(fontSize: normal),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Local A",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Yaounde",
                        style: TextStyle(fontSize: normal, color: ColorsU.grey),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "10",
                        style: TextStyle(
                            fontSize: valueList, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Cadenas(s)",
                        style: TextStyle(fontSize: normal),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
