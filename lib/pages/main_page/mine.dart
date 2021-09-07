import 'package:butter/models/butter.dart';
import 'package:butter/utils/constants.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BACKGROUND_GREY_COLOR,
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
          double thumbWidth = 1;
          double thumbHeight = 1;
          double height = 1.0 * thumbWidth / thumbHeight;
          return StaggeredTile.count(1, height + 0.3);
        },
        crossAxisSpacing: 5,
      )
    );
  }
}
