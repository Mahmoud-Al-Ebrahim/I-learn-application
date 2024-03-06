import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/password_visible/password_visible_cubit.dart';
import 'package:graduation_project/features/authentication/Presentation/Pages/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key,required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already Have an Account?',
            style: MyFontStyle.lightStyle(14, Colors.black.withOpacity(0.6)),
          ),
          InkWell(
            onTap: (){
              context.read<PasswordVisibleCubit>().passwordVisible=false;
              if(text=="Login") {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              }
              else {
                Navigator.of(context).pop();
              }
            },
              child: Text(
            text,
            style: MyFontStyle.boldStyle(14, AppColors.primaryColor[25]!),
          ))
        ],
      ),
    );
  }
}
