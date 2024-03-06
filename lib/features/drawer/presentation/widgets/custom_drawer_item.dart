import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/Helper/app_color.dart';

import '../../../../Helper/font_style.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem(
      {Key? key, required this.iconUrl, required this.title, this.trailing, required this.function})
      : super(key: key);

  final String iconUrl;
  final String title;
  final Widget? trailing;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.01),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.04,
        child: InkWell(
          onTap: function,
          child:
              Row(
                children: [
                  SvgPicture.asset(
                    iconUrl,
                  color: AppColors.accentColor[50]! ,
                  height:MediaQuery.of(context).size.height*0.03 ,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
                    child: Text(title, style: MyFontStyle.boldStyle(MediaQuery.of(context).size.height*0.025,
                        AppColors.accentColor[50]!),),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}