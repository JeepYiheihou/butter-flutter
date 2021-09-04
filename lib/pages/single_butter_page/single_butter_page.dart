import 'package:butter/models/butter.dart';
import 'package:butter/utils/network.dart';
import 'package:flutter/material.dart';


class SingleButterPage extends StatefulWidget {

  final Butter butter;

  SingleButterPage(this.butter);

  @override
  _SingleButterPageState createState() => _SingleButterPageState(butter);
}

class _SingleButterPageState extends State<SingleButterPage> {

  Butter butter;

  _SingleButterPageState(this.butter);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(
        generateImageUrl(butter),
      ),
    );
  }
}
