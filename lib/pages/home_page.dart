import 'package:baklavasina/repositories/auth_repository.dart';
import 'package:baklavasina/widgets/last_matches_card_widget.dart';
import 'package:baklavasina/widgets/league_card_widget.dart';
import 'package:baklavasina/widgets/leagues_pageview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthRepository authRepository = Get.put(AuthRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text("Baklavasına"),
        actions: [
          IconButton(
              onPressed: () {
                authRepository.signOut();
              },
              icon: Icon(Icons.exit_to_app))
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeaguesPageViewWidget(),
                Row(
                  children: [Text("Son Oynanan Maçlar")],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 10,
                ),
                LastMatchesCard(),
                LastMatchesCard(),
                LastMatchesCard(),
                LastMatchesCard(),
                LastMatchesCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
