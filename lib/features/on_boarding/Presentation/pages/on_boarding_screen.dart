import 'package:flutter/material.dart';
import 'package:graduation_project/features/on_boarding/Presentation/widgets/app_logo.dart';
import 'package:graduation_project/features/on_boarding/Presentation/widgets/back_ground_gradient.dart';
import 'package:graduation_project/features/on_boarding/Presentation/widgets/page_view_body.dart';
import 'package:graduation_project/features/on_boarding/Presentation/widgets/page_view_button.dart';
import 'package:graduation_project/features/on_boarding/Presentation/widgets/page_view_indicator.dart';
class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/OnBoardingScreen';

   const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController myPageController;
  @override
  void initState() {
    // TODO: implement initState
    myPageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    myPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const  BackGroundGradient(),
          Column(
            children: [
             const Spacer(),
              const AppLogo(),
              PageViewBody(myPageController:myPageController),
              const  Spacer(),
              const PageViewIndicator(),
              const  Spacer(),
              PageViewButton(myPageController:myPageController),
              const  Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
