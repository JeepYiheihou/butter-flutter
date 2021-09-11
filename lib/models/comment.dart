class ButterComment {
  int commentId;
  int butterId;
  int posterUserId;
  int timestamp;
  String content;

  ButterComment(
    this.commentId,
    this.butterId,
    this.posterUserId,
    this.timestamp,
    this.content,
  );

  static fromMap(map){
    return ButterComment(
      map["commentId"],
      map["butterId"],
      map["posterUserId"],
      map["timestamp"],
      map["content"]
    );
  }
}