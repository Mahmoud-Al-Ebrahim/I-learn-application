import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/features/drawer/presentation/pages/my_drawer.dart';

import '../../../../Helper/font_style.dart';
import '../../../notifications/presentation/pages/notifications_page.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Row(
        children: [
          IconButton(onPressed: (){
            Scaffold.of(context).openDrawer(
            );
          }, icon: Icon(
            Icons.menu,
            size: 30,
            color: AppColors.primaryColor[25]!,
          )),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Marco',
              style: MyFontStyle.bookStyle(18, Colors.grey.shade600),
            ),
            Text(
              'Good Morning!',
              style: MyFontStyle.boldStyle(18, Colors.grey.shade800),
            ),
          ]),
          const Spacer(),
      Container(
        width: size.width*0.085,
        height: size.width*0.085,
        decoration:
             BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
               boxShadow: [
                 BoxShadow(
                     color: Colors.grey.shade300,
                     spreadRadius: 1,
                     blurRadius: 8,
                     offset: const Offset(0,0)
                 )
               ],
               ),
        child: Center(
          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context , MaterialPageRoute(builder: (_)=> const NotificationsPage()));
                },
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.grey.shade600,
                  size: size.width*0.08,
                ),
              ),
              Positioned(
                right: size.width*0.015,
                top: size.width*0.012,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
