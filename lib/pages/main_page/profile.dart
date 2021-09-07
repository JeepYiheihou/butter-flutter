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

        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ProfileItem("Name"),
            ProfileItem("Email"),
            ProfileItem("Notifications"),
            ProfileItem("About"),
            ProfileItem("Logout"),
          ]
        ).toList(),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String entryText;

  ProfileItem(this.entryText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Text(entryText),
    );
  }
}
