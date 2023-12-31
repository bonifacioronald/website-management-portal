import 'package:flutter/material.dart';
import '../../data/models/color.dart' as custom_colors;

class TableHeading extends StatelessWidget {
  List<String> columnHeaderList = [
    "AUTHOR ID",
    "POST ID",
    "TITLE",
    "BODY",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 40,
      color: custom_colors.secondaryColor,
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(
              "POST ID",
              style: TextStyle(
                  fontSize: 14,
                  color: custom_colors.fontColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 100,
            child: Text(
              "USER ID",
              style: TextStyle(
                  fontSize: 14,
                  color: custom_colors.fontColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "TITLE",
              style: TextStyle(
                  fontSize: 14,
                  color: custom_colors.fontColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Expanded(
            child: Text(
              "BODY",
              style: TextStyle(
                  fontSize: 14,
                  color: custom_colors.fontColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
