import 'package:flutter/material.dart';
import '../../data/models/color.dart' as custom_colors;

import '../../presentation/widgets/content_table.dart';
import '../../presentation/widgets/drop_down_entry_menu.dart';
import '../../presentation/widgets/page_indicator.dart';
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
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              height: 60,
              child: const Row(
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Show',
                style: TextStyle(fontSize: 14, color: custom_colors.fontColor),
              ),
              const SizedBox(
                width: 8,
              ),
              const DropDownEntryMenu(),
              const SizedBox(
                width: 8,
              ),
              Text(
                'entries',
                style: TextStyle(fontSize: 14, color: custom_colors.fontColor),
              ),
              const Spacer(),
              Text(
                'Search',
                style: TextStyle(fontSize: 14, color: custom_colors.fontColor),
              ),
              const SizedBox(
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
