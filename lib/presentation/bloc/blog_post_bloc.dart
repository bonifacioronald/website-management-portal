import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/blog_post.dart';
import '../../data/providers/blog_post_provider.dart';
import '../../data/repositories/blog_post_repository.dart';

part 'blog_post_event.dart';
part 'blog_post_state.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  //default total entries
  int currentTotalEntries = 10;

  BlogPostBloc() : super(BlogPostInitial()) {
    on<LoadBlogPost>((event, emit) async {
      final apiProvider = BlogPostProvider();
      final dataRepo = BlogPostRepository(apiProvider);
      await dataRepo.fetchAndSetBlogPostData();
      emit(BlogPostLoaded(BlogPostRepository.blogPost));
    });

    on<UpdateTotalEntries>((event, emit) {
      currentTotalEntries = event.totalEntries;
      List<BlogPost> displayedBlogPost =
          BlogPostRepository.blogPost.sublist(0, currentTotalEntries);
      emit(BlogPostLoaded(displayedBlogPost));
    });
  }
}
