import 'package:baklavasina/pages/base_page.dart';
import 'package:baklavasina/pages/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Orbitron",
        textTheme:
            TextTheme(bodyText1: TextStyle(color: Colors.amber, fontSize: 14)),
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        primaryColorDark: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
              fontSize: 24, fontFamily: "Orbitron", color: Colors.amber),
        ),
      ),
      home: LandingPage(),
    );
  }
}
