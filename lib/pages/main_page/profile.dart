import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final ScrollController scrollController;
  ProfilePage(this.scrollController);

  @override
  _ProfilePageState createState() => _ProfilePageState(scrollController);
}

class _ProfilePageState extends State<ProfilePage> {

  final ScrollController scrollController;
  _ProfilePageState(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView(
        controller: scrollController,
        children: [
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
          Text("user name"),
          Text("email"),
          Text("settings"),
        ],
      ),
    );
  }
}
