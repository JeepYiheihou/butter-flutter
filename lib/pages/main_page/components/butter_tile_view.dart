import 'package:butter/pages/single_butter_page/single_butter_page.dart';
import 'package:butter/utils/constants.dart';
import 'package:butter/models/butter.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class ButterTileView extends StatelessWidget {
  final Butter butter;

  ButterTileView(this.butter);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => SingleButterPage(butter)),
        );
      },
      child: ClipRRect(
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.white,
          child: Column(
            children: [
              ImageTileView(butter),
              DetailsTileView(butter),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ImageTileView extends StatelessWidget {
  final Butter butter;

  ImageTileView(this.butter);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: Image.network(
          p.join(
            IMAGE_URL,
            butter.imageName
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10),
      )
    );
  }
}

class DetailsTileView extends StatelessWidget {
  final Butter butter;

  DetailsTileView(this.butter);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(butter.name),
          Text(butter.name)
        ],
      )
    );
  }
}
