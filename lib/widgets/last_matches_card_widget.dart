import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LastMatchesCard extends StatefulWidget {
  const LastMatchesCard({Key? key}) : super(key: key);

  @override
  State<LastMatchesCard> createState() => _LastMatchesCardState();
}

class _LastMatchesCardState extends State<LastMatchesCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment(0.8, 0.5),
              colors: [
                Colors.amber,
                Colors.black54,
              ],
            ),
          ),
          padding: EdgeInsets.all(8),
          width: size.width * 0.9,
          height: size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Aslanlar",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
              Text(
                "9 - 6",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 25),
              ),
              Text(
                "Kaplanlar",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
