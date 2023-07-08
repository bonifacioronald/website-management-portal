import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:website_management_portal/data/models/blog_post.dart';
import 'package:website_management_portal/data/providers/blog_post_provider.dart';
import 'package:website_management_portal/data/repositories/blog_post_repository.dart';
import 'package:website_management_portal/presentation/bloc/blog_post_bloc.dart';
import 'package:website_management_portal/presentation/widgets/table_header.dart';
import 'package:website_management_portal/presentation/widgets/table_item.dart';
import '../../data/models/color.dart' as custom_colors;

class ContentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogPostBloc = BlocProvider.of<BlogPostBloc>(context);

    return BlocBuilder<BlogPostBloc, BlogPostState>(
      builder: (context, state) {
        if (state is BlogPostInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is BlogPostLoaded) {
          final List<BlogPost> blogPostList = state.blogPostList;
          return Column(
            children: [
              TableHeading(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: blogPostBloc.currentTotalEntries,
                    itemBuilder: (_, index) {
                      return TableItem(blogPostList[index]);
                    },
                  ),
                ),
              ),
            ],
          );
        }
        if (state is SearchingBlog) {
          final List<BlogPost> suggestedBlogPostList =
              state.suggestedBlogPostList;
          return Column(
            children: [
              TableHeading(),
              Expanded(
                child: suggestedBlogPostList.length == 0
                    ? Center(
                        child: Text(
                          "Sorry, we can not find any matching data",
                          style: TextStyle(
                              fontSize: 14, color: custom_colors.fontColor),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: (suggestedBlogPostList.length >
                                  blogPostBloc.currentTotalEntries)
                              ? blogPostBloc.currentTotalEntries
                              : suggestedBlogPostList.length,
                          itemBuilder: (_, index) {
                            return TableItem(suggestedBlogPostList[index]);
                          },
                        ),
                      ),
              ),
            ],
          );
        }

        return Container(); // Placeholder widget when state is not BlogPostLoaded
      },
    );
  }
}
