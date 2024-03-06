import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../home/presentation/widgets/course_Card.dart';

class SearchResult extends StatefulWidget {
  const SearchResult(this.response,{Key? key}) : super(key: key);
 final response;
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(top:18.0),
              child:   CourseCard(true,0,index,widget.response),
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: widget.response[0]['featured_materials'].length
        ),
      );
  }
}