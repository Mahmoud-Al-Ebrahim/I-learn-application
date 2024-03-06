import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
class GraduationAppBar extends StatelessWidget implements PreferredSizeWidget {
   GraduationAppBar({
    this.search = false,
    this.centerTitle = false,
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
  });

  final bool search, centerTitle;
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      backgroundColor: Colors.white,
      centerTitle: centerTitle,
      titleTextStyle: MyFontStyle.boldStyle(18, AppColors.accentColor[150]!),
      shadowColor: Colors.grey.withOpacity(.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      title: search
          ? Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        //TODO: Add the search logic
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        //TODO: Clear the search feild
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          : Text('$title'),
      actions: actions,
      leading:leading ,
      leadingWidth: leadingWidth,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
