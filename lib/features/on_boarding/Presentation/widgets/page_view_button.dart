import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/authentication/Presentation/Pages/sign_up_screen.dart';
import 'package:graduation_project/features/on_boarding/Presentation/cubit/navigation_cubit.dart';
import 'package:graduation_project/features/on_boarding/Presentation/cubit/navigation_state.dart';
import 'package:graduation_project/global_widget/custom_button.dart';
class PageViewButton extends StatelessWidget {
  const PageViewButton({Key? key ,required this.myPageController}) : super(key: key);
   final PageController myPageController;
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return  BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state is NavigationToPage) {
            return Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.1, right: size.width * 0.1),
              child: LayoutBuilder(builder: (context, constraints) {
                return CustomButton(
                  content: Text(
                    state.pageNumber == 2 ? 'Get Start' : 'NEXT',
                    style: MyFontStyle.bookStyle(
                        16, AppColors.primaryColor[100]!),
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
                    if(state.pageNumber<2) {
                      myPageController.animateToPage(
                          state.pageNumber + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    }
                   else {
                      // SharedPreferencesHelper.makeOnBoardingViewed();
                      Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
                    }
                  },
                );
              }),
            );
          } else {
            return Container();
          }
        });
  }
}
