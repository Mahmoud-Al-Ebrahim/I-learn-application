import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';

import 'loader.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppColors.scaffoldBackGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please Wait...',style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 30,),
             Loader()
          ],
        ),
      ),
    );
  }
}
