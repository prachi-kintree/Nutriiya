class Comment {
  // ignore: constant_identifier_names
  static const TAG = 'Comment';
  String? commentId;
  String? avatar;
  String? userName;
  int? likeCount;
  String? content;
  bool? canEditPost;
  bool? canDeleteComment;
  String? commentDuration;
  bool? isLiked;
  String? postId;
  String? ownerId;

  Comment(
      {required this.avatar,
      required this.userName,
      required this.content,
      this.commentId,
      this.likeCount,
      this.canEditPost,
      this.isLiked = false,
      this.canDeleteComment,
      this.commentDuration,
      this.ownerId,
      this.postId});
}
