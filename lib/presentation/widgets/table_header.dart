import 'package:flutter/material.dart';
import '../../data/models/color.dart' as custom_colors;

class TableHeading extends StatelessWidget {
  List<String> columnHeaderList;

  TableHeading(this.columnHeaderList);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 40,
      color: custom_colors.secondaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: columnHeaderList.length,
        itemBuilder: (_, index) {
          double columnWidth =
              MediaQuery.of(context).size.width / columnHeaderList.length;
          return Container(
            width: columnWidth,
            alignment: Alignment.centerLeft,
            child: Text(
              columnHeaderList[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: custom_colors.fontColor),
            ),
          );
        },
      ),
    );
  }
}
