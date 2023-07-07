import 'package:flutter/material.dart';
import 'package:website_management_portal/data/models/blog_post.dart';
import 'package:provider/provider.dart';
import 'package:website_management_portal/data/providers/blog_post_provider.dart';

class Repository {
  BlogPostProvider apiProvider;

  Repository(this.apiProvider);

  List<BlogPost> _blogPost = [];

  List<BlogPost> get blogPost {
    return [..._blogPost];
  }
}
