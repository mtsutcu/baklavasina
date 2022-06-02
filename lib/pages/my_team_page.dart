import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({Key? key}) : super(key: key);

  @override
  State<MyTeamPage> createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size.width,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://gonen.bandirma.edu.tr/Content/Web/Yuklemeler/Haber/SlaytResim/15781/62fe4ef1-c21d-455a-4120-51dc7b3e0914.jpg"),
                ),
              ),
            ),
            Text(
              "Aslanlar",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.amber, fontSize: 24),
            ),
            SizedBox(
              height: 30,
            ),
            Text("İstatistikler"),
            Container(
              margin: EdgeInsets.all(10),
              width: size.width,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.1, 0.1),
                      colors: [
                    Colors.grey.shade700,
                    Colors.black54,
                  ])),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, int index) => ListTile(
                  title: Text("Ahmet"),
                  trailing: Text("10"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Oyuncular"),
            CarouselSlider.builder(
              itemCount: 7,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
                int pageIndex,
              ) =>
                  Container(
                width: size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment(1, 0.1),
                        colors: [
                      Colors.grey.shade700,
                      Colors.black54,
                    ])),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                          "https://gonen.bandirma.edu.tr/Content/Web/Yuklemeler/Haber/SlaytResim/15781/62fe4ef1-c21d-455a-4120-51dc7b3e0914.jpg"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "25",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 26),
                        ),
                        Text(
                          "25",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 26),
                        ),
                        Text(
                          "25",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 26),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Gol",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Güç",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Maç",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                    /*ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, int index) => ListTile(
                        title: Text("Ahmet"),
                        trailing: Text("10"),
                      ),
                    ),*/
                  ],
                ),
              ),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                height: size.height * 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
