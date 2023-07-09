import 'package:flutter/material.dart';
import '../../data/models/color.dart' as custom_colors;

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PreviousPageButton(),
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
              _PageButton("1", true),
              _PageButton("2", false),
              _PageButton("...", false),
              _PageButton("9", false),
              _PageButton("10", false),
            ],
          ),
        ),
        SizedBox(
          width: 8,
        ),
        _NextPageButton()
      ],
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
  bool isSelected;

  _PageButton(this.page, this.isSelected);

  @override
  Widget build(BuildContext context) {
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
