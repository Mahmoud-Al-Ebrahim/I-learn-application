import 'package:flutter/material.dart';
import 'package:graduation_project/main.dart';

import '../Helper/app_color.dart';
class AppBottomSheet<T> extends StatelessWidget {
  const AppBottomSheet._({
    Key? key,
    required this.child,
  }) : super(key: key);


  final Widget child;

  static Future<T?> show<T>({
    required BuildContext? context,
    required final Widget child,
     final bool? enableDrag,
     final bool? isDismissible,
     final bool? isScrollControlled,
  }) =>
      showModalBottomSheet<T>(
        context: context ?? GraduationProject.navKey.currentContext!,
        enableDrag: enableDrag ?? true,
        isDismissible: isDismissible ?? true,
        isScrollControlled: isScrollControlled ?? true,
        backgroundColor:AppColors.scaffoldBackGroundColor,
        builder: (_) => AppBottomSheet._(child: child),
      );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
