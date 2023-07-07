import 'package:flutter/material.dart';
import 'package:website_management_portal/data/models/blog_post.dart';
import 'package:provider/provider.dart';
import 'package:website_management_portal/data/providers/blog_post_provider.dart';

class BlogPostRepository {
  BlogPostProvider apiProvider;

  BlogPostRepository(this.apiProvider);

  static List<BlogPost> _blogPost = [];

  static List<BlogPost> get blogPost {
    return [..._blogPost];
  }

  Future<void> fetchAndSetBlogPostData() async {
    try {
      List<Map<String, dynamic>> extractedData =
          await apiProvider.fetchBlogPost();
      List<BlogPost> loadedBlogPost = [];
      extractedData.forEach(
        (blog) {
          loadedBlogPost.add(
            BlogPost(
              userId: blog["userId"].toString(),
              id: blog["id"].toString(),
              title: blog['title'],
              body: blog["body"],
            ),
          );
          //print(blog["id"]);
        },
      );
      _blogPost = loadedBlogPost;
    } catch (e) {
      throw Exception("Converesion failed");
    }
  }
}
