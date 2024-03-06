import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(this.isSelected, {Key? key}) : super(key: key);
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: isSelected
                  ? AppColors.primaryColor[50]!
                  : AppColors.accentColor[50]!),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? AppColors.primaryColor[50]!
              : AppColors.scaffoldBackGroundColor),
      child: Center(
        child: Text('Syrian',
            style: MyFontStyle.boldStyle(
                18,
                isSelected
                    ? AppColors.scaffoldBackGroundColor
                    : AppColors.primaryColor[50]!)),
      ),
    );
  }
}
