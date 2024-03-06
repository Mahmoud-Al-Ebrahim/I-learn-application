import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
class BackGroundGradient extends StatelessWidget {
  const BackGroundGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor[200]!,
            AppColors.primaryColor[300]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      );
  }
}
