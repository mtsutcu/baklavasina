import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LeagueCardWidget extends StatefulWidget {
  final String leagueText;
  const LeagueCardWidget({Key? key, required this.leagueText})
      : super(key: key);

  @override
  State<LeagueCardWidget> createState() => _LeagueCardWidgetState();
}

class _LeagueCardWidgetState extends State<LeagueCardWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.leagueText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Card(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.1, 0.1),
                    colors: [
                  Colors.amber,
                  Colors.black54,
                ])),
            width: size.width * 0.9,
            height: size.height * 0.4,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Takım",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Puan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: size.width * 0.04),
                  width: size.width * 0.8,
                  height: size.height * 0.37,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: Text("10"),
                          title: Text("Merhaba"),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
