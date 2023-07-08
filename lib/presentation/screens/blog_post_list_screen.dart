import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_management_portal/data/providers/blog_post_provider.dart';
import 'package:website_management_portal/data/repositories/blog_post_repository.dart';
import 'package:website_management_portal/presentation/bloc/blog_post_bloc.dart';
import 'package:website_management_portal/presentation/widgets/content_table.dart';
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
      body: BlocBuilder<BlogPostBloc, BlogPostState>(
        builder: (context, state) {
          if (state is BlogPostInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is BlogPostLoaded) {
            return Container(
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
            );
          } else
            return Container();
        },
      ),
    );
  }
}

class _TableEntriesAndSearch extends StatefulWidget {
  @override
  State<_TableEntriesAndSearch> createState() => _TableEntriesAndSearchState();
}

class _TableEntriesAndSearchState extends State<_TableEntriesAndSearch> {
  List<String> entryOptions = ["5", "6", "7", "8", "9", "10"];
  String? selectedEntry;

  @override
  Widget build(BuildContext context) {
    final blogPostBloc = BlocProvider.of<BlogPostBloc>(context);
    selectedEntry = blogPostBloc.currentTotalEntries.toString();
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
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: custom_colors.secondaryColor, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButton<String>(
                  underline: Container(),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  isExpanded: true,
                  value: selectedEntry,
                  items: entryOptions
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                                fontSize: 14, color: custom_colors.fontColor),
                          )))
                      .toList(),
                  onChanged: (item) => setState(
                    () {
                      selectedEntry = item;
                      blogPostBloc
                          .add(UpdateTotalEntries(int.parse(selectedEntry!)));
                    },
                  ),
                ),
              ),
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
