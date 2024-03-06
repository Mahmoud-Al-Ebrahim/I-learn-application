import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/home/presentation/pages/home_screen.dart';
import 'package:graduation_project/global_widget/custom_button.dart';
class AuthButton extends StatelessWidget {
  const AuthButton({Key? key,required this.text,required this.onTapFunction}) : super(key: key);
  final String text;
  final Function() onTapFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),
      child: CustomButton(
        buttonColor: AppColors.primaryColor[25]!,
          content: Text(
            text,
            style: MyFontStyle.bookStyle(16, AppColors.accentColor[25]!),
          ),
          onPressed: onTapFunction,
          width: MediaQuery.of(context).size.width*0.86),
    );
  }
}
