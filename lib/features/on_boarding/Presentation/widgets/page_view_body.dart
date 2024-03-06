import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/on_boarding/Data/on_boarding_data.dart';
import 'package:graduation_project/features/on_boarding/Presentation/cubit/navigation_cubit.dart';
class PageViewBody extends StatefulWidget {
 const PageViewBody({Key? key, required this.myPageController}) : super(key: key);
  final PageController myPageController;

  @override
  _PageViewBodyState createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 12,
      child: PageView.builder(
        onPageChanged: (index) {
          context.read<NavigationCubit>().navigateToPage(index);
        },
        controller: widget.myPageController,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: size.height * 0.03),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: SvgPicture.asset(
                    onBoardingData[index].imageUrl,
                    width: size.width * 0.8,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    bottom: size.height * 0.02,
                  ),
                  child: Text(
                    onBoardingData[index].title,
                    textAlign: TextAlign.center,
                    style: MyFontStyle.bookStyle(
                      18,
                      AppColors.accentColor[25]!,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.1),
                  child: Text(
                    onBoardingData[index].description,
                    textAlign: TextAlign.center,
                    style: MyFontStyle.lightStyle(
                      14,
                      AppColors.accentColor[25]!,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
