part of 'blog_post_bloc.dart';

abstract class BlogPostState extends Equatable {
  const BlogPostState();

  @override
  List<Object> get props => [];
}

class BlogPostInitial extends BlogPostState {}

class BlogPostLoaded extends BlogPostState {
  final List<BlogPost> blogPostList;

  BlogPostLoaded(this.blogPostList);

  @override
  List<Object> get props => [blogPostList];
}
