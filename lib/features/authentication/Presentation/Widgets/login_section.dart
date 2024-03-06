import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/login_circle_option.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: AppColors.primaryColor[400]!.withOpacity(0.3),
                height: 1,
                width: size.width * 0.38,
              ),
              SizedBox(
                  width: size.width * 0.1,
                  child: Text(
                    'Or',
                    style: MyFontStyle.lightStyle(14, Colors.black),
                    textAlign: TextAlign.center,
                  )),
              Container(
                color: AppColors.primaryColor[400]!.withOpacity(0.3),
                height: 1,
                width: size.width * 0.38,
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top:size.height*0.03),
            child: Text(
              'login with',
              style: MyFontStyle.lightStyle(16, Colors.black.withOpacity(0.7)),
            ),
          ),
           Padding(
             padding:  EdgeInsets.only(top:size.height*0.03),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                 const LoginCircleOption( iconUrl: 'assets/auth_icons/google_plus_icon.svg'),
                 SizedBox(width: size.width*0.1,),
                const LoginCircleOption(iconUrl: 'assets/auth_icons/facebook_icon.svg')
              ],
          ),
           ),

        ],
      ),
    );
  }
}
