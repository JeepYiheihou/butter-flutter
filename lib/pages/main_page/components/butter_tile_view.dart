import 'package:butter/models/media_item.dart';
import 'package:butter/models/user.dart';
import 'package:butter/pages/single_butter_page/single_butter_page.dart';
import 'package:butter/models/butter.dart';
import 'package:butter/utils/network.dart';
import 'package:flutter/material.dart';

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
              SizedBox(height: 5),
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
    MediaItem mediaItem = this.butter.mediaItems[0];
    return Container(
      child: ClipRRect(
        child: Image.network(
          ButterHttpUtils.generateMediaItemUrl(mediaItem.url),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10),
      )
    );
  }
}

class DetailsTileView extends StatefulWidget {
  final Butter butter;

  DetailsTileView(this.butter);

  @override
  _DetailsTileViewState createState() => _DetailsTileViewState(butter);
}

class _DetailsTileViewState extends State<DetailsTileView> {

  Butter butter;
  User? user;
  _DetailsTileViewState(this.butter);

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
    return Flexible(
        child: Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    butter.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20
                    )
                ),
                UserNameWithSmallAvatar(user),
              ],
            )
        )
    );
  }
}


class UserNameWithSmallAvatar extends StatelessWidget {

  final User? user;
  UserNameWithSmallAvatar(this.user);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowContents = [];
    if (user != null) {
      String url = ButterHttpUtils.generateAvatarUrl(user!.avatarUrl);
      rowContents = [
        ClipRRect(
          borderRadius: BorderRadius.circular(7.5),
          child: Image.network(url, height: 15, width: 15),
        ),
        Text(user!.name),
      ];

    }
    return Row(
      children: rowContents,
    );
  }
}