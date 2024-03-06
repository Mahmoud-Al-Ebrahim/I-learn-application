import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
import '../widgets/drawer_body.dart';
import '../widgets/profile_header.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer(this.response,{Key? key}) : super(key: key);
  final response;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
      child: Drawer(
        child: Column(
          children: [
           const ProfileHeader(),
            Padding(
              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02),
              child: SizedBox(
                  child:  DrawerBody(widget.response)),
            ),
            const Spacer(),
            Text(
              'TRADEA version 2.0.0',
              style: MyFontStyle.bookStyle(MediaQuery.of(context).size.height*0.02, AppColors.accentColor[150]!),
            )
          ],
        ),
      ),
    );
  }
}
