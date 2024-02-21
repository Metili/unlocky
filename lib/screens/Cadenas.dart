// ignore: file_names
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:unlocky/components/HeaderMenu.dart';
import 'package:unlocky/components/SearchAdd.dart';
import 'package:unlocky/components/TitleU.dart';
import 'package:unlocky/components/lockList.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

class Cadenas extends StatefulWidget {
  final bool? implyLeading;
  const Cadenas({super.key, this.implyLeading});

  @override
  State<Cadenas> createState() => _CadenasState();
}

class _CadenasState extends State<Cadenas> {
  String searchQuery = '';
  final locks = [
    LockList(
      leftIcon: Icons.lock,
      isFree: true,
    ),
    LockList(
      leftIcon: Icons.lock,
      isFree: false,
    ),
    LockList(
      leftIcon: Icons.lock,
      isFree: true,
    ),
  ];

  final keys = [
    LockList(
      leftIcon: Icons.key,
      isFree: true,
    ),
    LockList(
      leftIcon: Icons.key,
      isFree: false,
    ),
    LockList(
      leftIcon: Icons.key,
      isFree: true,
    ),
    LockList(
      leftIcon: Icons.key,
      isFree: false,
    ),
    LockList(
      leftIcon: Icons.key,
      isFree: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: widget.implyLeading ?? false,
        title: TitleU(
          title: "Local A".toUpperCase(),
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
          // HeaderMenu(
          //     implyLeading:
          //         arguments == null ? false : arguments['implyLeading'],
          //     title: TitleU(
          //       title: "Local A",
          //       size: pageTitle,
          //       textColor: ColorsU.secondary,
          //     )),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchAdd(
                  placeholder: "Rechercher un cadenas/serrure...",
                  context: context,
                  addLink: '/locations/add',
                  onChange: (String value) {
                    // setState(() {
                    //   searchQuery = value;
                    //   print("query ==> ${searchQuery}");
                    // });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Cadenas",
                      style: TextStyle(
                          fontSize: pageTitle,
                          color: ColorsU.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
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
                    )
                  ],
                ),
                const Divider(
                  height: 10.0,
                  color: ColorsU.secondary,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: locks.length,
                  itemBuilder: (context, index) => locks[index],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                /* Serrures section */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Serrures",
                      style: TextStyle(
                          fontSize: pageTitle,
                          color: ColorsU.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
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
                    )
                  ],
                ),
                const Divider(
                  height: 10.0,
                  color: ColorsU.secondary,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: keys.length,
                  itemBuilder: (context, index) => keys[index],
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
