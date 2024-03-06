import 'package:flutter/material.dart';
import 'package:graduation_project/features/road_map/presentation/pages/road_map_details.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';

class RoadMapPage extends StatefulWidget {
  const RoadMapPage(this.response,{Key? key}) : super(key: key);
 final response;
  @override
  State<RoadMapPage> createState() => _RoadMapPageState();
}

class _RoadMapPageState extends State<RoadMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        title: Text(
          'RoadMaps',
          style: MyFontStyle.boldStyle(22, AppColors.accentColor[50]!),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
            color: AppColors.accentColor[50]!,
          ),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => RoadMapDetails(widget.response)));
            },
            child: Container(
              margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/mobile.png', width: double.infinity,height: 250,fit: BoxFit.fill,))),
          ),
          Container(
            margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset('assets/web_design.png', width: double.infinity,height: 250,fit: BoxFit.fill,))),
          Container(
            margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset('assets/back_end.jpg', width: double.infinity,height: 250,fit: BoxFit.fill,))),
          Container(
            margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                  borderRadius:BorderRadius.circular(25) ,
                  child: Image.asset('assets/ui.jpg', width: double.infinity,height: 250,fit: BoxFit.fill,))),
        ],
      ),
    );
  }
}
