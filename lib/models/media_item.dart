class MediaItem {
  int mediaItemId;
  String type;
  String url;
  int displayHeight;
  int displayWidth;

  MediaItem(
    this.mediaItemId,
    this.type,
    this.url,
    this.displayHeight,
    this.displayWidth,
  );

  static MediaItem fromMap(map) {
    return MediaItem(
      map["mediaItemId"],
      map["type"],
      map["url"],
      map["displayHeight"],
      map["displayWidth"]
    );
  }
}