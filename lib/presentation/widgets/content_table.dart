import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_management_portal/data/models/blog_post.dart';
import 'package:website_management_portal/data/providers/blog_post_provider.dart';
import 'package:website_management_portal/data/repositories/blog_post_repository.dart';
import 'package:website_management_portal/presentation/widgets/table_header.dart';
import '../../data/models/color.dart' as custom_colors;

class ContentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BlogPost> _blogPostList = BlogPostRepository.blogPost;

    return Column(
      children: [
        TableHeading(),
        Expanded(
          child: Container(
            width: double.infinity,
            child: ListView.builder(
                itemCount: _blogPostList.length,
                itemBuilder: (_, index) {
                  return Text(_blogPostList[index].title);
                }),
          ),
        )
      ],
    );
  }
}
