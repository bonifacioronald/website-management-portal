import 'package:flutter/material.dart';
import '../../data/models/color.dart' as custom_colors;

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: custom_colors.secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
