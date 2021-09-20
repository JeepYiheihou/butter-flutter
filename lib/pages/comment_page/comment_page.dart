import 'dart:convert';

import 'package:butter/common/global.dart';
import 'package:butter/models/butter.dart';
import 'package:butter/pages/components/button_style.dart';
import 'package:butter/pages/components/toast.dart';
import 'package:butter/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CommentPage extends StatefulWidget {

  final Butter butter;
  CommentPage(this.butter);

  @override
  _CommentPageState createState() => _CommentPageState(butter);
}

class _CommentPageState extends State<CommentPage> {
  Butter butter;
  String contentText = "";

  _CommentPageState(this.butter);

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
            TextField(
              onChanged: (content) {
                setState(() {
                  contentText = content;
                });
              },
              keyboardType: TextInputType.multiline,
              maxLength: 8000,
              maxLines: null,
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                if (contentText.length == 0) {
                  ButterToast.showToast(
                    context,
                    "Say something, don't comment with a silence \n（｡・`ω´･）",
                  );
                  return;
                }

                String url = ButterHttpUtils.generateCommentPostUrl();
                Map commentMap = {
                  "butterId": butter.butterId,
                  "posterUserId": Global.user!.userId,
                  "contentText": contentText,
                };
                ButterHttpUtils.request(
                  url,
                  method: "POST",
                  data: jsonEncode(commentMap),
                ).then((res) {
                  ButterToast.showToast(
                    context,
                    "Successfully posted a comment （・∀・）",
                  );
                  Navigator.pop(context);
                }).catchError((err) {
                  print(err.toString());
                });
              },
              child: Text("Comment"),
              style: ButterButtonStyle.mainThemeButtonStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
