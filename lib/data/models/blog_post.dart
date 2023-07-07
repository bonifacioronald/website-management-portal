// class BlogPost {
//   String postId;
//   String title;
//   String body;
//   String categoryId;
//   String status;
//   String label;
//   DateTime createdAt;
//   DateTime updatedAt;

//   BlogPost(
//       {required this.postId,
//       required this.title,
//       required this.body,
//       required this.categoryId,
//       required this.status,
//       required this.label,
//       required this.createdAt,
//       required this.updatedAt});
// }

class BlogPost {
  String userId;
  String id;
  String title;
  String body;

  BlogPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}
