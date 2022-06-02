import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget({Key? key}) : super(key: key);

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  String? _selectedCity;
  String? _selectedCouncil;
  String? _selectedGender;
  List<String> _sehirler = [
    "İstanbul",
    "Ankara",
    "Bursa",
    "İzmir",
    "Antalya",
    "Edirne",
    "Zonguldak",
    "Sivas",
    "Samsun",
  ];
  List<String> _genders = ["Erkek", "Kadın"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownSearch<String>(
          dropdownButtonProps: IconButtonProps(
            icon: Icon(
              Icons.arrow_downward,
              color: Theme.of(context).primaryColor,
            ),
          ),
          showClearButton: true,
          clearButtonProps: IconButtonProps(
              icon: Icon(
            Icons.clear,
            color: Theme.of(context).primaryColor,
          )),
          popupProps: PopupProps.menu(
            menuProps: MenuProps(),
            showSelectedItems: true,
          ),
          items: _sehirler,
          dropdownSearchDecoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              labelText: "Şehir"),
          onChanged: (e) {
            setState(() {
              _selectedCity = e;
            });
            print("Selected City: " + _selectedCity.toString());
          },
          selectedItem: null,
        ),
        DropdownSearch<String>(
          dropdownButtonProps: IconButtonProps(
            icon: Icon(
              Icons.arrow_downward,
              color: Theme.of(context).primaryColor,
            ),
          ),
          showClearButton: true,
          clearButtonProps: IconButtonProps(
              icon: Icon(
            Icons.clear,
            color: Theme.of(context).primaryColor,
          )),
          popupProps: PopupProps.menu(
            menuProps: MenuProps(),
            showSelectedItems: true,
          ),
          items: SelectCouncil(_selectedCity),
          dropdownSearchDecoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              labelText: "İlçe"),
          onChanged: (e) {
            setState(() {
              _selectedCouncil = e;
            });
            print("Selected Council: " + _selectedCouncil.toString());
          },
          selectedItem: null,
        ),
        DropdownSearch<String>(
          dropdownButtonProps: IconButtonProps(
            icon: Icon(
              Icons.arrow_downward,
              color: Theme.of(context).primaryColor,
            ),
          ),
          showClearButton: true,
          clearButtonProps: IconButtonProps(
              icon: Icon(
            Icons.clear,
            color: Theme.of(context).primaryColor,
          )),
          popupProps: PopupProps.menu(
            menuProps: MenuProps(),
            showSelectedItems: true,
          ),
          items: _genders,
          dropdownSearchDecoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              labelText: "Cinsiyet"),
          onChanged: (e) {
            setState(() {
              _selectedGender = e;
            });
            print("Selected Gender: " + _selectedGender.toString());
          },
          selectedItem: null,
        )
      ],
    );
  }

  List<String> SelectCouncil(String? city) {
    switch (city) {
      case "İstanbul":
        return [
          "Başakşehir",
          "Sarıyer",
          "Bağcılar",
          "Kadıköy",
          "Üsküdar",
          "Sultangazi",
          "Arnavutköy",
          "Silivri",
          "Küçükçekmece",
        ];
      case "Ankara":
        return ["Kızılay", "Mamak", "Çankaya"];
      default:
        return [];
    }
  }
}
