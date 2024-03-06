import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';

class ActiveCircle extends StatelessWidget {
  const ActiveCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      width: 25,
      height: 10,
      decoration: BoxDecoration(
        color: AppColors.accentColor[25]!,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(12),
          right: Radius.circular(12),
        ),
        boxShadow: [BoxShadow(
          color: AppColors.primaryColor[400]!,
          offset: const Offset(0,2),
          spreadRadius: 0.2,
          blurRadius:5
        )],
      ),
    );
  }
}
