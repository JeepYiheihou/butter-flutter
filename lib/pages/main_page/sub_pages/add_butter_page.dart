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

  List<XFile> images = [];

  final scrollController;
  _AddButterPageState(this.scrollController);
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        images.add(image);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: scrollController,
        children: [
          GridView.count(
            // GridView inside ListView. Nested scrollable widgets.
            // So this shrinkWrap flag is needed to avoid errors.
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              images.length,
              (index) {
                return ImagePreviewUnit(images[index]);
              }
            ),
          ),
          Container(
            child: ElevatedButton(
              child: Icon(
                Icons.camera_alt,
                color: Colors.redAccent,
              ),
              onPressed: getImage,
            ),
            margin: EdgeInsets.only(top: 20.0),
          ),
        ],
      ),
    );
  }
}

class ImagePreviewUnit extends StatelessWidget {
  final XFile image;
  ImagePreviewUnit(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(
        File(image.path),
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
