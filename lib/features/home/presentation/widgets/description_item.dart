import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/font_style.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem(
      {Key? key,
      required this.icon,
      required this.value,
      required this.color,
      required this.flex,
      this.title})
      : super(key: key);
  final IconData icon;
  final String value;
  final String? title;
  final Color color;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            value,
            style: MyFontStyle.bookStyle(12, Colors.grey.shade400),
          ),
          title != null
              ? Text(
                  title!,
                  style: MyFontStyle.bookStyle(12, Colors.grey.shade400),
                )
              : Container(),
        ],
      ),
    );
  }
}
