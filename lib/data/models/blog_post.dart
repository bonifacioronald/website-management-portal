import 'package:equatable/equatable.dart';

class BlogPost extends Equatable {
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

  @override
  List<Object?> get props => [userId, id, title, body];
}
