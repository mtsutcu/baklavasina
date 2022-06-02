import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StadiumCardWidget extends StatefulWidget {
  final String stadiumName;

  const StadiumCardWidget({
    Key? key,
    required this.stadiumName,
  }) : super(key: key);

  @override
  State<StadiumCardWidget> createState() => _StadiumCardWidgetState();
}

class _StadiumCardWidgetState extends State<StadiumCardWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(20),
      width: size.width * 0.8,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbLml5VsfDdMxRUZn5DH26vzBMYW19sc8e23PdsvbjsCFEInjOiDYGISb6cE6NOUBC3H8&usqp=CAU"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: size.width * 0.8,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Theme.of(context).backgroundColor.withOpacity(0.5)),
            padding: EdgeInsets.only(left: 10, bottom: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.stadiumName),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white)),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {},
                  child: Text("Randevu al"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
