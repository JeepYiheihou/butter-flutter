class ButterComment {
  int? commentId;
  int butterId;
  int posterUserId;
  int creationTimestamp;
  String contentText;

  ButterComment(
    this.commentId,
    this.butterId,
    this.posterUserId,
    this.creationTimestamp,
    this.contentText,
  );

  static fromMap(map){
    return ButterComment(
      map["commentId"],
      map["butterId"],
      map["posterUserId"],
      map["creationTimestamp"],
      map["contentText"]
    );
  }
}