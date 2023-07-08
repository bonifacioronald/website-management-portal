import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_management_portal/data/providers/blog_post_provider.dart';
import 'package:website_management_portal/data/repositories/blog_post_repository.dart';
import 'package:website_management_portal/presentation/bloc/blog_post_bloc.dart';
import 'package:website_management_portal/presentation/widgets/content_table.dart';
import 'package:website_management_portal/presentation/widgets/drop_down_entry_menu.dart';
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
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 60,
                padding: EdgeInsets.all(20),
                width: 200,
                child: Container(
                  color: Colors.yellow,
                  child: Text("Next Page"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TableEntriesAndSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogPostBloc = BlocProvider.of<BlogPostBloc>(context);
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
