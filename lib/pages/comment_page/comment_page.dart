import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text("Comment:"),
            Divider(),
            TextField(),
            Divider()
          ],
        ),
      ),
    );
  }
}
