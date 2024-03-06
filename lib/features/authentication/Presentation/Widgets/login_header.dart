import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/password_visible/password_visible_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderLoginScreen extends StatelessWidget {
  const HeaderLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.read<PasswordVisibleCubit>().passwordVisible=false;
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.accentColor[150]!,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
          child: Text(
            'Login',
            style: MyFontStyle.boldStyle(
                35, AppColors.primaryColor[25]!),
          ),
        )
      ],
    );
  }
}
