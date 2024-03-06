
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/course_details/course_details_page.dart';
import 'course_Card.dart';

class FeaturedSection extends StatefulWidget {
  const FeaturedSection(this.response,this.index,{Key? key}) : super(key: key);
 final response;
 final int index;
  @override
  _FeaturedSectionState createState() => _FeaturedSectionState();
}

class _FeaturedSectionState extends State<FeaturedSection> {
  @override
  Widget build(BuildContext context) {
    int sz=widget.response[widget.index]['featured_materials'].length;
    final Size size=MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemBuilder: (context,index,pageViewIndex){
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> CourseDetailsPage(index,widget.response)));
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical:size.height*0.01),
            child:  CourseCard(false,widget.index,index,widget.response),
          )
        );
      },
      itemCount: sz,
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          reverse: true,
          autoPlayInterval: const Duration(seconds: 3,milliseconds: 500),
          initialPage: 0,
          aspectRatio: 1.3,
          viewportFraction: 0.73,
          pauseAutoPlayOnTouch: true,
          enableInfiniteScroll: true,
      ),
    );
  }
}
