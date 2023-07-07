import 'package:flutter/material.dart';
import 'package:website_management_portal/presentation/widgets/table_header.dart';
import '../../data/models/color.dart' as custom_colors;

class ContentTable extends StatelessWidget {
  List<String> columnHeaderList = [
    "POST ID",
    "TITLE",
    "BODY",
    "CATEGORY ID",
    "STATUS",
    "LABEL",
    "CREATED AT",
    "UPDATED AT"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHeading(columnHeaderList),
      ],
    );
  }
}
