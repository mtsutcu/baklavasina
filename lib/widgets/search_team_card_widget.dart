import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchTeamCardWidget extends StatefulWidget {
  const SearchTeamCardWidget({Key? key}) : super(key: key);

  @override
  State<SearchTeamCardWidget> createState() => _SearchTeamCardWidgetState();
}

class _SearchTeamCardWidgetState extends State<SearchTeamCardWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment(0.1, 0.1),
                colors: [
              Colors.amber,
              Colors.black54,
            ])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    "Başakşehir",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 10),
                  ),
                  Text("46"),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Image(
              width: size.width * 0.25,
              height: size.width * 0.25,
              image: NetworkImage(
                  "https://img.acunn.com/foto/700x600/uploads/icerikler/2019/10/11/dunya-hali-saha-sampiyonasi18128184455da0a4c3cd5c3.jpg"),
            ),
            Text("Aslanlar"),
          ],
        ),
      ),
    );
  }
}
