import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddButterPage extends StatefulWidget {

  final scrollController;

  AddButterPage(this.scrollController);

  @override
  _AddButterPageState createState() => _AddButterPageState(scrollController);
}

class _AddButterPageState extends State<AddButterPage> {

  final scrollController;
  _AddButterPageState(this.scrollController);
  XFile? _image;
  Future _getImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print(_image.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(
        child: FlatButton(
        child: Icon(
          Icons.camera_alt,
          color: Colors.redAccent,
        ),
        onPressed: this._getImage,
        color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 20.0),
        ),
      ],
    );
  }
}
