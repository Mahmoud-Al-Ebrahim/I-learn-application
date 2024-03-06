import 'package:flutter/material.dart';
import 'package:graduation_project/features/course_details/lesson_item.dart';

class LessonSection extends StatelessWidget {
  const LessonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: ListView.separated(
          itemCount: 8,
          separatorBuilder: (_,__)=>const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          itemBuilder: (context,index){
            return const LessonItem();
          }),
    );
  }
}
