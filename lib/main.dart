import 'package:butter/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: MainContainer(),
    );
  }
}

class MainContainer extends StatefulWidget {
  MainContainer({Key? key}) : super(key: key);

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainPage(),
      ),
    );
  }
}
