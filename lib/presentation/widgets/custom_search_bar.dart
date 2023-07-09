import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/color.dart' as custom_colors;

import '../../presentation/bloc/blog_post_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final blogPostBloc = BlocProvider.of<BlogPostBloc>(context);
    return Container(
      width: 240,
      height: 40,
      child: TextField(
        controller: searchController,
        cursorColor: custom_colors.fontColor,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              searchController.clear();
              blogPostBloc.isSearching = false;
              blogPostBloc.currentPage = 1;
              blogPostBloc.add(LoadBlogPost());
            },
            child: Icon(
              Icons.close,
              color: custom_colors.fontColor,
              size: 14,
            ),
          ),
          hintText: "enter title...",
          hintStyle: TextStyle(
              fontSize: 14, color: custom_colors.fontColor.withOpacity(0.4)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: custom_colors.secondaryColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: custom_colors.secondaryColor, width: 2),
          ),
        ),
        onChanged: (query) {
          blogPostBloc.add(SearchBlogPost(query.toLowerCase()));
        },
      ),
    );
  }
}
