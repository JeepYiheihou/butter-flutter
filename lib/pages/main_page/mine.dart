import 'package:butter/models/butter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'components/butter_tile_view.dart';

class MinePage extends StatefulWidget {

  final ScrollController scrollController;
  MinePage(this.scrollController);

  @override
  _MinePageState createState() => _MinePageState(scrollController);
}

class _MinePageState extends State<MinePage> {

  final ScrollController scrollController;
  _MinePageState(this.scrollController);

  List<Butter> butters = [
    Butter(1, 2, "cute1", "1.jpeg", 225, 225),
    Butter(1, 2, "cute2", "2.jpeg", 225, 225),
    Butter(1, 2, "cute3", "3.jpeg", 800, 800),
    Butter(1, 2, "cute4", "4.jpeg", 720, 960),
    Butter(1, 2, "cute5", "5.jpeg", 800, 800),
    Butter(1, 2, "cute6", "6.jpeg", 1080, 1080),
    Butter(1, 2, "cute7", "7.jpeg", 225, 225),
    Butter(1, 2, "cute8", "8.jpeg", 225, 225),
    Butter(1, 2, "cute9", "9.jpeg", 800, 800),
    Butter(1, 2, "cute10", "10.jpeg", 720, 960),
    Butter(1, 2, "cute11", "11.jpeg", 800, 800),
    Butter(1, 2, "cute12", "12.jpeg", 1080, 1080),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 230, 230, 230),
      child: StaggeredGridView.countBuilder(
        controller: scrollController,
        crossAxisCount: 2,
        itemCount: butters.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: ButterTileView(butters[index])
          );
        },
        staggeredTileBuilder: (int index) {
          var currButter = butters[index];
          double height = 1.0 * currButter.thumbWidth / currButter.thumbHeight;
          return StaggeredTile.count(1, height + 0.3);
        },
        crossAxisSpacing: 5,
      )
    );
  }
}
