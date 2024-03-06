import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/Helper/font_style.dart';

import '../Helper/app_color.dart';

class AppChips extends StatelessWidget {
   AppChips({
    Key? key,
    this.isSelected = false,
    this.iconUrl,
    this.textStyle,
    required this.text,
    this.onChangeChips,
    this.fontSize,
    this.verticalPadding,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final ValueChanged<String?>? onChangeChips;
  final double? fontSize;
  final String? iconUrl;
  final TextStyle? textStyle;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    Color? color = isSelected
        ? AppColors.primaryColor[50]!
        : AppColors.scaffoldBackGroundColor;
    Color? textColor = isSelected ? Colors.white : AppColors.accentColor[50]!;

    return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: verticalPadding ?? 10),
            decoration: BoxDecoration(
                color: color,
                border: isSelected
                    ? null
                    : Border.all(color: const Color(0xffF2F3F3)),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconUrl != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          iconUrl!,
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                      )
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      ),
                Text(
                  text,
                  style:
                      MyFontStyle.bookStyle(17, AppColors.accentColor[50]!)
                          .copyWith(color: textColor, fontSize: fontSize),
                ),
              ],
            ),
          );
  }
}
