import 'package:baklavasina/widgets/dropdown_menu_widget.dart';
import 'package:baklavasina/widgets/stadium_card_widget.dart';
import 'package:flutter/material.dart';

class StadiumsPage extends StatefulWidget {
  const StadiumsPage({Key? key}) : super(key: key);

  @override
  State<StadiumsPage> createState() => _StadiumsPageState();
}

class _StadiumsPageState extends State<StadiumsPage> {
  String? _selectedCity;
  String? _selectedCouncil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                //DropdownMenuWidget(),
                StadiumCardWidget(
                  stadiumName: " Arslan Halı Saha",
                ),
                StadiumCardWidget(
                  stadiumName: " Aziz Halı Saha",
                ),
                StadiumCardWidget(
                  stadiumName: " Performans Halı Saha",
                ),
              ],
            ),
          ),
        ));
  }
}
