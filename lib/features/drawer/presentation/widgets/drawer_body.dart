import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/features/competitions/presentation/pages/competitions.dart';
import 'package:graduation_project/features/drawer/presentation/widgets/custom_drawer_item.dart';
import 'package:graduation_project/features/home/presentation/pages/home_screen.dart';
import 'package:graduation_project/features/on_boarding/Presentation/pages/on_boarding_screen.dart';
import 'package:graduation_project/features/projects/presentation/pages/project_page.dart';
import 'package:graduation_project/features/road_map/presentation/pages/road_map_page.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
import '../../../../global_widget/custom_button.dart';
import '../../../favorites/pages/favorite_page.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody(this.response,{Key? key}) : super(key: key);
  final response;

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Theme(
        data: ThemeData(

        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTileItem(
            function: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>  FavoritePage(widget.response)));
            },
            iconUrl: 'assets/sidebar/favorite_icon.svg',
            title: 'Favorite',
          ),
          ListTileItem(
            function: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>  RoadMapPage(widget.response)));
            },
            iconUrl: 'assets/sidebar/favorite_icon.svg',
            title: 'RoadMaps',
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.025, vertical: size.height * 0.005),
            color: AppColors.primaryColor[400]!.withOpacity(0.3),
            height: 1,
            width: size.width * 0.95,
          ),
          ListTileItem(
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const Competitions()));
              },
              iconUrl: 'assets/sidebar/competitions.svg',
              title: 'Competitions'),
          ListTileItem(
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProjectsPage() ));
              },
              iconUrl: 'assets/sidebar/projects.svg',
              title: 'Projects'),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.025, vertical: size.height * 0.005),
            color: AppColors.primaryColor[400]!.withOpacity(0.3),
            height: 1,
            width: size.width * 0.95,
          ),
          ListTileItem(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Scaffold(
                              backgroundColor: AppColors.primaryColor[25]!,
                              body: Column(
                                children: [
                                  Spacer(),
                                  Expanded(
                                    flex: 1,
                                    child: SvgPicture.asset(
                                        'assets/start_application/logo_splash.svg'),
                                  ),
                                  Spacer(flex: 2,),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                        'learning , competitions , experience , real projects all of that you will find it in this application',
                                      textAlign: TextAlign.center,

                                       style: MyFontStyle.bookStyle(25, AppColors.scaffoldBackGroundColor),
                                    ),
                                  ),
                                  Spacer(flex: 2,),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                      child: CustomButton(
                                        content: Text(
                                          ' let\'s Get Started',
                                          style: MyFontStyle.boldStyle(
                                              22, AppColors.primaryColor[100]!),
                                        ),
                                        width: size.width,
                                        shapeBorder: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(12),
                                              right: Radius.circular(12)),
                                        ),
                                        shadowColor: AppColors.primaryColor[400],
                                        buttonColor: AppColors.accentColor[25]!,
                                        elevation: 5,
                                        onPressed: () {
                                         Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )));
              },
              iconUrl: 'assets/sidebar/about_icon.svg',
              title: 'About app'),
          ListTileItem(
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const OnBoardingScreen()));
              },
              iconUrl: 'assets/sidebar/logout_icon.svg',
              title: 'Log out'),
        ]),
      ),
    );
  }
}
