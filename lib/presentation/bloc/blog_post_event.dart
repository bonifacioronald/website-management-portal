part of 'blog_post_bloc.dart';

abstract class BlogPostEvent extends Equatable {
  const BlogPostEvent();

  @override
  List<Object> get props => [];
}

class LoadBlogPost extends BlogPostEvent {}

class UpdateTotalEntries extends BlogPostEvent {
  int totalEntries;

  UpdateTotalEntries(this.totalEntries);

  @override
  List<Object> get props => [totalEntries];
}

class SearchBlogPost extends BlogPostEvent {
  String searchKey;

  SearchBlogPost(this.searchKey);

  @override
  List<Object> get props => [searchKey];
}

class ChangePage extends BlogPostEvent {
  int currentPage;

  ChangePage(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}
