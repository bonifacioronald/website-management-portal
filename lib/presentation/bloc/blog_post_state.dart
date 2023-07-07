part of 'blog_post_bloc.dart';

abstract class BlogPostState extends Equatable {
  const BlogPostState();
  
  @override
  List<Object> get props => [];
}

class BlogPostInitial extends BlogPostState {}
