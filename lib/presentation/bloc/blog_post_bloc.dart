import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_post_event.dart';
part 'blog_post_state.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  BlogPostBloc() : super(BlogPostInitial()) {
    on<BlogPostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
