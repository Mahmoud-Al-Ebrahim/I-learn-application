 import 'package:flutter/material.dart';

import '../../Helper/app_color.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 15) ,
      padding: EdgeInsets.all(12),
      decoration:
      BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all( Radius.circular(12)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0,0)
          )
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0,0)
                    )
                  ]
              ),
              child: ClipRRect(
                  borderRadius:  BorderRadius.circular(15),
                  child: Image.asset('assets/preview.jpg')),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Introduction to UI/UX Design', style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 20
                  )),
                  const SizedBox(height: 15),
                  Row(
                    children:const  [
                      Icon(Icons.lock_clock,color: Colors.black54 ,size: 20,),
                      Text('45 minutes', style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
