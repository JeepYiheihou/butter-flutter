import 'package:butter/models/media_item.dart';

class Butter {
  int butterId;
  int userId;
  String title;
  String contentText;
  String type;
  List<MediaItem> mediaItems;

  Butter(
    this.butterId,
    this.userId,
    this.title,
    this.contentText,
    this.type,
    this.mediaItems
  );

  static Butter fromMap(map) {
    List<MediaItem> mediaItems = [];
    for (var mediaItemMap in map["mediaItems"]) {
      mediaItems.add(MediaItem.fromMap(mediaItemMap));
    }

    return Butter(
      map["butterId"],
      map["userId"],
      map["title"],
      map["contentText"],
      map["type"],
      mediaItems,
    );
  }
}