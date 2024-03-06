import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/home/presentation/widgets/description_item.dart';

import '../../../course_details/course_details_page.dart';

class RecommendedSection extends StatefulWidget {
  const RecommendedSection(this.response,{Key? key}) : super(key: key);
 final response;
  @override
  State<RecommendedSection> createState() => _RecommendedSectionState();
}

class _RecommendedSectionState extends State<RecommendedSection> {
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> CourseDetailsPage(index,widget.response)));
          },
          child: Container(
            width: size.width*0.7,
            margin: EdgeInsets.symmetric(horizontal:size.width*0.02,vertical: size.height*0.01 ),
            padding: EdgeInsets.all(size.height*0.01),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * 0.05),
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
                Container(
                  height: size.height*0.12,
                  width: size.width*0.3,
                  padding:  EdgeInsets.only(left:size.width*0.02),
                  decoration: BoxDecoration(
                      image:  DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(index % 3 == 1
                            ? 'assets/preview.jpg'
                            : (index % 3 == 2
                            ? 'assets/data/img.png'
                            : 'assets/data/img_1.png'),
                      ),),
                      borderRadius: BorderRadius.circular(size.width * 0.05)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Painting',style: MyFontStyle.boldStyle(20, Colors.grey.shade800),),
                      Text('\$65.00',style: MyFontStyle.boldStyle(15, Colors.grey.shade500),),
                      Row(
                          children:[
                            DescriptionItem(icon:Icons.access_time,value:'10 ',color:Colors.grey.shade400,title: 'hours',flex:0),
                            const DescriptionItem(icon:Icons.star,value:'4.5 ',color:Colors.yellowAccent,flex: 0,),
                            ]
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: 15,
    );
  }
}
