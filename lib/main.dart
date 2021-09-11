import 'package:butter/pages/login_page/login_page.dart';
import 'package:butter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/global.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  Global.init().then((e) {
    runApp(MainApp());
  });
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Butter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        fontFamily: MAIN_FONT_FAMILY,
        backgroundColor: Colors.white,
      ),
      home: MainContainer(),
    );
  }
}

class MainContainer extends StatefulWidget {

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LoginPage(),
    );
  }
}
