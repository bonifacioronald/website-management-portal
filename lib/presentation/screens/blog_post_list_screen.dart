import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_management_portal/presentation/bloc/blog_post_bloc.dart';
import 'package:website_management_portal/presentation/widgets/content_table.dart';
import 'package:website_management_portal/presentation/widgets/drop_down_entry_menu.dart';
import 'package:website_management_portal/presentation/widgets/page_indicator.dart';
import '../../data/models/color.dart' as custom_colors;
import '../widgets/custom_search_bar.dart';

class BlogPostListScreen extends StatelessWidget {
  const BlogPostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text('Server Side',
              style: TextStyle(
                  fontSize: 20,
                  color: custom_colors.fontColor,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: custom_colors.primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: custom_colors.primaryColor,
        child: Column(
          children: [
            const Divider(
              height: 1,
            ),
            _TableEntriesAndSearch(),
            Expanded(child: ContentTable()),
            Container(
              padding: EdgeInsets.only(right: 20, bottom: 20),
              //      color: Colors.red,
              height: 60,
              child: Row(
                children: [
                  Spacer(),
                  PageIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableEntriesAndSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Show',
                style: TextStyle(fontSize: 14, color: custom_colors.fontColor),
              ),
              SizedBox(
                width: 8,
              ),
              DropDownEntryMenu(),
              SizedBox(
                width: 8,
              ),
              Text(
                'entries',
                style: TextStyle(fontSize: 14, color: custom_colors.fontColor),
              ),
              Spacer(),
              Text(
                'Search',
                style: TextStyle(fontSize: 14, color: custom_colors.fontColor),
              ),
              SizedBox(
                width: 8,
              ),
              CustomSearchBar(),
            ],
          )
        ],
      ),
    );
  }
}
