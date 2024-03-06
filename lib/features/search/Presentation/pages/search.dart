import 'package:flutter/material.dart';
import 'package:graduation_project/features/search/Presentation/widgets/filter_categories_section.dart';

import '../../../../Helper/font_style.dart';
import '../../../home/presentation/widgets/myBottom_navigation_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/searching_result.dart';

class Search extends StatefulWidget {
  const Search(this.response,{Key? key}) : super(key: key);
 final response;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar:  myBottomNavigationBar(widget.response),
          body: SafeArea(
            child: Padding(
              padding:  EdgeInsets.only(top:  size.height * 0.05,left: size.width*0.03,right: size.width*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Explore',
                    style: MyFontStyle.boldStyle(25, Colors.black.withOpacity(0.7)),
                  ),
                      Padding(
                        padding:  EdgeInsets.only(top:size.height * 0.03,bottom:size.height * 0.01 ,),
                        child: const SearchBar(),
                      ),
                 const FilterCategoriesSection(),
                  SearchResult(widget.response),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
