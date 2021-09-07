import 'dart:developer';

import 'package:butter/models/butter.dart';
import 'package:butter/models/media_item.dart';
import 'package:butter/models/user.dart';
import 'package:butter/utils/constants.dart';
import 'package:butter/utils/network.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SingleButterPage extends StatefulWidget {

  final Butter butter;

  SingleButterPage(this.butter);

  @override
  _SingleButterPageState createState() => _SingleButterPageState(butter);
}

class _SingleButterPageState extends State<SingleButterPage> {

  Butter butter;
  User? user;

  _SingleButterPageState(this.butter);

  @override
  void initState() {
    super.initState();
    String url = ButterHttpUtils.generateUserUrl(butter.ownerId.toString());
    ButterHttpUtils.request(url).then((res) {
      setState(() {
        user = User.fromMap(res.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = 0;
    for (var item in butter.mediaItems) {
      double h = width * item.displayHeight / item.displayWidth;
      if (h > height) {
        height = h;
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserNameWithBigAvatar(user)
              ],
            )
          ),
          Container(
            height: height,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                MediaItem mediaItem = butter.mediaItems[index];
                return Image.network(
                  ButterHttpUtils.generateMediaItemUrl(mediaItem.url),
                  fit: BoxFit.fitWidth,
                );
              },
              itemCount: butter.mediaItems.length,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: BACKGROUND_GREY_COLOR,
                  size: 5
                )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SingleButterViewButtonsSet(),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("MAKE A BUTTER"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                          fontFamily: MAIN_FONT_FAMILY,
                        )
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  butter.title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7),
                Text(butter.contentText),
              ],
            ),
          )
        ],
      )
    );
  }
}

class UserNameWithBigAvatar extends StatelessWidget {
  final User? user;
  UserNameWithBigAvatar(this.user);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowContents = [];
    if (user != null) {
      String url = ButterHttpUtils.generateAvatarUrl(user!.avatarUrl);
      rowContents = [
        ClipRRect(
          borderRadius: BorderRadius.circular(7.5),
          child: Image.network(url, height: 50, width: 50),
        ),
        SizedBox(width: 10),
        Text(user!.name),
      ];
    }
    return Row(
      children: rowContents,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

class SingleButterViewButtonsSet extends StatelessWidget {

  IconButton getLittleButton(icon, onPressed) {
    return IconButton(
      icon: icon,
      color: MAIN_THEME_COLOR,
      onPressed: onPressed,
      constraints: BoxConstraints(
        minWidth: 10
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          SizedBox(width: 10),
          getLittleButton(Icon(Icons.star), (){}),
          SizedBox(width: 10),
          getLittleButton(Icon(Icons.chat), (){}),
          SizedBox(width: 10),
          getLittleButton(Icon(Icons.favorite), (){}),
        ],
      ),
    );
  }
}
