import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_management_portal/data/repositories/blog_post_repository.dart';
import 'package:website_management_portal/presentation/bloc/blog_post_bloc.dart';
import '../../data/models/color.dart' as custom_colors;

class PageIndicator extends StatefulWidget {
  const PageIndicator({super.key});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  late int currentPage;
  late int firstPageOption;
  late int secondPageOption;
  late int secondToLastPageOption;
  late int lastPageOption;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogPostBloc, BlogPostState>(
      builder: (context, state) {
        final blogPostBloc = BlocProvider.of<BlogPostBloc>(context);
        currentPage = blogPostBloc.currentPage;
        firstPageOption = 1;
        secondPageOption = firstPageOption + 1;
        lastPageOption = (BlogPostRepository.blogPost.length /
                blogPostBloc.currentTotalEntries)
            .ceil();
        secondToLastPageOption = lastPageOption - 1;
        blogPostBloc.lastPageOption = lastPageOption;
        return Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (blogPostBloc.currentPage - 1 >= 1) {
                      blogPostBloc
                          .add(ChangePage(blogPostBloc.currentPage - 1));
                    }
                  });
                },
                child: _PreviousPageButton()),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 160,
              height: 32,
              decoration: BoxDecoration(
                color: custom_colors.secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => setState(() {
                            blogPostBloc.add(ChangePage(firstPageOption));
                          }),
                      child: _PageButton(firstPageOption.toString())),
                  GestureDetector(
                      onTap: () => setState(() {
                            blogPostBloc.add(ChangePage(secondPageOption));
                          }),
                      child: _PageButton(secondPageOption.toString())),
                  _PageButton("..."),
                  GestureDetector(
                      onTap: () => setState(() {
                            blogPostBloc
                                .add(ChangePage(secondToLastPageOption));
                          }),
                      child: _PageButton(secondToLastPageOption.toString())),
                  GestureDetector(
                      onTap: () => setState(() {
                            blogPostBloc.add(ChangePage(lastPageOption));
                          }),
                      child: _PageButton(lastPageOption.toString())),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (blogPostBloc.currentPage + 1 <=
                          blogPostBloc.lastPageOption) {
                        blogPostBloc
                            .add(ChangePage(blogPostBloc.currentPage + 1));
                      }
                    },
                  );
                },
                child: _NextPageButton())
          ],
        );
      },
    );
  }
}

class _PreviousPageButton extends StatelessWidget {
  const _PreviousPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: custom_colors.secondaryColor),
      child: Center(
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: custom_colors.fontColor,
          size: 12,
        ),
      ),
    );
  }
}

class _NextPageButton extends StatelessWidget {
  const _NextPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: custom_colors.secondaryColor),
      child: Center(
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: custom_colors.fontColor,
          size: 12,
        ),
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  String page;

  _PageButton(this.page);

  @override
  Widget build(BuildContext context) {
    final blogPostBloc = BlocProvider.of<BlogPostBloc>(context);
    bool isSelected = (page == blogPostBloc.currentPage.toString());

    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? custom_colors.accentColor
              : custom_colors.secondaryColor),
      child: Center(
        child: Text(
          page,
          style: TextStyle(
              color: isSelected ? Colors.white : custom_colors.fontColor,
              fontSize: 12),
        ),
      ),
    );
  }
}