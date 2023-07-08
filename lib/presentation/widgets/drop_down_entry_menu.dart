import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/color.dart' as custom_colors;
import '../bloc/blog_post_bloc.dart';

class DropDownEntryMenu extends StatefulWidget {
  const DropDownEntryMenu({super.key});

  @override
  State<DropDownEntryMenu> createState() => _DropDownEntryMenuState();
}

class _DropDownEntryMenuState extends State<DropDownEntryMenu> {
  List<String> entryOptions = ["5", "6", "7", "8", "9", "10"];
  String? selectedEntry;

  @override
  Widget build(BuildContext context) {
    final blogPostBloc = BlocProvider.of<BlogPostBloc>(context);
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: custom_colors.secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton<String>(
        underline: Container(),
        padding: EdgeInsets.symmetric(horizontal: 12),
        isExpanded: true,
        value: blogPostBloc.currentTotalEntries.toString(),
        items: entryOptions
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:
                      TextStyle(fontSize: 14, color: custom_colors.fontColor),
                ),
              ),
            )
            .toList(),
        onChanged: (item) {
          setState(() {
            selectedEntry = item;
            blogPostBloc.add(UpdateTotalEntries(int.parse(selectedEntry!)));
          });
        },
      ),
    );
  }
}
