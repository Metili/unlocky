import 'package:flutter/material.dart';
import 'package:unlocky/components/HeaderMenu.dart';
import 'package:unlocky/components/SearchAdd.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/components/components.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';
import 'package:unlocky/screens/Cadenas.dart';

class Locaux extends StatefulWidget {
  final bool? implyLeading;
  const Locaux({super.key, this.implyLeading});

  @override
  State<Locaux> createState() => _LocauxState();
}

class _LocauxState extends State<Locaux> {
  @override
  Widget build(BuildContext context) {
    String? routeName = ModalRoute.of(context)!.settings.name;
    String searchQuery = '';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: widget.implyLeading ?? false,
        title: TitleU(
          title: "Locaux".toUpperCase(),
          size: pageTitle,
          textColor: ColorsU.secondary,
        ),
        shadowColor: Colors.white,
        elevation: 4.0,
        backgroundColor: ColorsU.whiteSmoke,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SearchAdd(
                //   placeholder: "Rechercher un local...",
                //   context: context,
                //   addLink: '/locations/add',
                //   onChange: (String value) {
                //     // setState(() {
                //     //   searchQuery = value;
                //     //   print("query ==> ${searchQuery}");
                //     // });
                //   },
                // ),
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
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const Cadenas(implyLeading: true)))
                    // Navigator.pushNamed(context, '/locks', arguments: {'implyLeading': true})
                  },
                  child: Container(
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
                                  fontSize: valueList,
                                  fontWeight: FontWeight.bold),
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
                              style: TextStyle(
                                  fontSize: normal, color: ColorsU.grey),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: valueList,
                                  fontWeight: FontWeight.bold),
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
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
