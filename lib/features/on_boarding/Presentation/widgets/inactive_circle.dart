import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';

class InactiveCircle extends StatelessWidget {
  const InactiveCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
          border: Border.all(color:AppColors.accentColor[25]!),
          color: AppColors.primaryColor[400]!,
        shape: BoxShape.circle
      ),
    );
  }
}
