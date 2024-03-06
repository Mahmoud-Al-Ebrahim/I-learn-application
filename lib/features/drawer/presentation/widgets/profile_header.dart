import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: AppColors.primaryColor[25]!,
          height: size.height * 0.3,
          child: SvgPicture.asset(
            'assets/sidebar/pattern.svg',
            fit: BoxFit.cover,
            color: AppColors.accentColor[25]!.withOpacity(0.1),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:size.height*0.04),
            child: SizedBox(
              height: size.height * 0.23,
              child: Column(
                children: [
                   Container(
                      width: size.height*0.15,
                      height: size.height*0.15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image:  DecorationImage(
                              fit: BoxFit.cover,
                              image:  AssetImage(
                                  'assets/profile.png')
                          )
                      )),
                  SizedBox(
                    width: size.width * 0.4,
                    child: Text(
                      'Marco',
                      textAlign: TextAlign.center,
                      style:
                          MyFontStyle.bookStyle(size.height*0.03, AppColors.accentColor[25]!),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: SizedBox(
                      width: size.width * 0.4,
                      child: Text(
                        'master',
                        textAlign: TextAlign.center,
                        style: MyFontStyle.lightStyle(
                            size.height*0.02, Colors.amber),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
