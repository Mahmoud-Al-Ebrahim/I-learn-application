import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/widgets/course_Card.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';

class RoadMapDetails extends StatefulWidget {
  const RoadMapDetails(this.response,{Key? key}) : super(key: key);
   final response;
  @override
  State<RoadMapDetails> createState() => _RoadMapDetailsState();
}

class _RoadMapDetailsState extends State<RoadMapDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackGroundColor,
          title: Text(
            'Mobile Development RoadMap',
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 25,),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'First Learning about Dart',
                  style: MyFontStyle.boldStyle(22, AppColors.primaryColor[50]!),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 15,),
              ),
               SliverToBoxAdapter(
                child: CourseCard(false,0,0,widget.response),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 15,),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Second Learning about Flutter Widgets',
                  style: MyFontStyle.boldStyle(22, AppColors.primaryColor[50]!),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 15,),
              ),
               SliverToBoxAdapter(
                child: CourseCard(false,0,1,widget.response),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 15,),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Third Learning about Design pattern',
                  style: MyFontStyle.boldStyle(22, AppColors.primaryColor[50]!),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 15,),
              ),
               SliverToBoxAdapter(
                child: CourseCard(false,1,0,widget.response),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 25,),
              ),
            ],
          ),
        ));
  }
}
