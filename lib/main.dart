import 'package:butter/pages/login_page/login_page.dart';
import 'package:butter/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
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
    return Container(
      color: Colors.white,
      child: LoginPage(),
    );
  }
}
