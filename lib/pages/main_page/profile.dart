import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ScrollController scrollController;
  ProfilePage(this.scrollController);

  @override
  _ProfilePageState createState() => _ProfilePageState(scrollController);
}

class _ProfilePageState extends State<ProfilePage> {

  ScrollController scrollController;
  _ProfilePageState(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("profile"),
    );
  }
}
