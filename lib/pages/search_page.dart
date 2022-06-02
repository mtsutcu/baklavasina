import 'package:baklavasina/widgets/search_team_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
            height: 35,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade900,
            ),
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(4),
            child: TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent))),
            )),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: GridView.count(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          children: <Widget>[
            SearchTeamCardWidget(),
            SearchTeamCardWidget(),
            SearchTeamCardWidget(),
            SearchTeamCardWidget(),
            SearchTeamCardWidget(),
            SearchTeamCardWidget(),
          ],
        ),
      ),
    );
  }
}
