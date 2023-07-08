import 'package:flutter/material.dart';
import 'package:website_management_portal/data/models/blog_post.dart';
import '../../data/models/color.dart' as custom_colors;

class TableItem extends StatelessWidget {
  BlogPost item;

  TableItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          height: 40,
          color: custom_colors.primaryColor,
          child: Row(
            children: [
              Container(
                width: 100,
                child: Text(
                  item.id,
                  style: TextStyle(
                    fontSize: 14,
                    color: custom_colors.fontColor,
                  ),
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  item.userId,
                  style: TextStyle(
                    fontSize: 14,
                    color: custom_colors.fontColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: custom_colors.fontColor,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Text(
                  item.body,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: custom_colors.fontColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 2,
          color: custom_colors.secondaryColor,
        )
      ],
    );
  }
}
