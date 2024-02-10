import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unlocky/api/command.dart';
import 'package:unlocky/constains/colors.dart';
import 'package:unlocky/constains/sizes.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset:
                    const Offset(0, 3), // changes the position of the shadow
              ),
            ],
          ),
          child: AppBar(
            // leading: IconButton(
            //   icon: const Icon(
            //     Icons.menu,
            //     size: iconHomeSize,
            //   ),
            //   onPressed: () {
            //     // Action à effectuer lorsque l'icône est pressée
            //   },
            // ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: iconHomeSize,
                ),
                onPressed: () {
                  // Action à effectuer lorsque l'icône est pressée
                },
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => {
            // ignore: avoid_print
            print('Container tapped!')
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 20.0),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(60, 202, 201, 201)),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '60',
                    style: TextStyle(
                        color: ColorsU.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Locaux enregistrés",
                    style: TextStyle(
                        color: ColorsU.secondary,
                        fontSize: h2,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: ColorsU.secondary,
                    size: iconSize,
                  )
                ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => {
                    // ignore: avoid_print
                    print('Container serrure tapped!')
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorsU.white,
                        border: Border.all(width: 1, color: ColorsU.primary)),
                    height: 170,
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.key,
                              size: homeIconCardSize,
                            )
                          ],
                        ),
                        Text(
                          "40",
                          style: TextStyle(
                              fontSize: 50,
                              color: ColorsU.secondary,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow
                              .ellipsis, // Tronquer avec des points de suspension
                          maxLines: 1,
                        ),
                        Text(
                          "Serrure(s)",
                          style: TextStyle(fontSize: h2, color: ColorsU.secondary),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => {
                    // ignore: avoid_print
                    print('Container lock tapped!')
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorsU.white,
                        border: Border.all(width: 1, color: ColorsU.secondary)),
                    height: 170,
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.lock,
                              size: homeIconCardSize,
                            )
                          ],
                        ),
                        Text(
                          "40",
                          style: TextStyle(
                              fontSize: 50,
                              color: ColorsU.primary,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow
                              .ellipsis, // Tronquer avec des points de suspension
                          maxLines: 1,
                        ),
                        Text(
                          "Cadena(s)",
                          style: TextStyle(fontSize: h2, color: ColorsU.secondary),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
