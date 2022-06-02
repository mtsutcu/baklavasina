import 'package:baklavasina/pages/home_page.dart';
import 'package:baklavasina/pages/my_team_page.dart';
import 'package:baklavasina/pages/profile_page.dart';
import 'package:baklavasina/pages/search_page.dart';
import 'package:baklavasina/pages/stadiums_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BasePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = <Widget>[
    HomePage(),
    SearchPage(),
    StadiumsPage(),
    MyTeamPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),
      /*Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LeaguesPageViewWidget(),
          ],
        ),
      ),*/

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'a',
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'a',
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stadium_outlined),
            label: 'a',
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined),
            label: 'a',
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'a',
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
