import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/blog_post.dart';
import '../../data/providers/blog_post_provider.dart';
import '../../data/repositories/blog_post_repository.dart';

part 'blog_post_event.dart';
part 'blog_post_state.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  int currentTotalEntries = 10;
  List<BlogPost> searchedBlogPost = [];
  bool isSearching = false;

  BlogPostBloc() : super(BlogPostInitial()) {
    on<LoadBlogPost>(
      (event, emit) async {
        final dataRepo = BlogPostRepository(BlogPostProvider());
        await dataRepo.fetchAndSetBlogPostData();
        emit(BlogPostLoaded(BlogPostRepository.blogPost));
      },
    );

    on<UpdateTotalEntries>(
      (event, emit) {
        print(isSearching);
        currentTotalEntries = event.totalEntries;
        List<BlogPost> displayedBlogPost = [];
        if (isSearching == true) {
          //show whats searched instead
          if (searchedBlogPost.length > currentTotalEntries) {
            //if the suggestion list > selected total entry, only display as many as the total entry
            displayedBlogPost =
                searchedBlogPost.sublist(0, currentTotalEntries);
          } else {
            //if the suggestion list < selected total entry, display all suggestion
            displayedBlogPost = searchedBlogPost;
          }
          emit(SearchingBlog(displayedBlogPost));
        } else {
          //show everything
          displayedBlogPost =
              BlogPostRepository.blogPost.sublist(0, currentTotalEntries);
          emit(BlogPostLoaded(displayedBlogPost));
        }
      },
    );

    on<SearchBlogPost>(
      (event, emit) {
        if (event.searchKey == "") {
          isSearching = false;
        } else {
          isSearching = true;
          List<BlogPost> suggestion = BlogPostRepository.blogPost.where((post) {
            return post.title.contains(event.searchKey);
          }).toList();
          searchedBlogPost = suggestion;
          emit(SearchingBlog(searchedBlogPost));
        }
      },
    );
  }
}
