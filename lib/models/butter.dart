import 'package:butter/models/media_item.dart';

class Butter {
  int butterId;
  int ownerId;
  String title;
  String contentText;
  String type;
  List<MediaItem> mediaItems;

  Butter(
    this.butterId,
    this.ownerId,
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
      map["ownerId"],
      map["title"],
      map["contentText"],
      map["type"],
      mediaItems,
    );
  }
}