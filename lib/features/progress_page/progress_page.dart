import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/progress_page/progress_tab.dart';

import '../home/presentation/widgets/myBottom_navigation_bar.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage(this.response,{Key? key}) : super(key: key);
final response;

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child:Scaffold(
          bottomNavigationBar:  myBottomNavigationBar(widget.response),
      appBar: AppBar(
        titleTextStyle: MyFontStyle.boldStyle(25, Colors.black87).copyWith(
        ),
        centerTitle: true,
        title:
            const Text('My Progress'),
        backgroundColor: AppColors.scaffoldBackGroundColor,
        bottom: const TabBar(
          indicatorColor: AppColors.primaryColor,
          tabs:  [
            Tab(
              child:
                  Text('In Progress (4)', style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20
                  )),
            ),
            Tab(
                child:
                    Text('Completed (8)', style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20
                    )),)
          ],
        ),
      ),
      body:const  TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
             ProgressTab(),
             ProgressTab(),
        ],
      ),),
    );
  }
}
