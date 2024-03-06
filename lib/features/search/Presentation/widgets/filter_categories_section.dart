import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';

import '../../../../Helper/font_style.dart';

class FilterCategoriesSection extends StatefulWidget {
  const FilterCategoriesSection({Key? key}) : super(key: key);

  @override
  State<FilterCategoriesSection> createState() =>
      _FilterCategoriesSectionState();
}

class _FilterCategoriesSectionState extends State<FilterCategoriesSection> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: size.height*0.01),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                margin:EdgeInsets.only(
                    right: size.width * 0.03,
                    top: size.width * 0.02,
                    bottom: size.width * 0.03,
                    left: size.width * 0.01),
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: index == currentSelected
                          ? AppColors.primaryColor[25]!
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: const Offset(0, 0))
                      ],
                    ),
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Icon(
                                  Icons.category_outlined,
                                  color: index != currentSelected
                                      ?Colors.grey.shade600
                                      : Colors.white,
                                  size: size.height * 0.03,
                                ),
                              ),
                            Padding(padding: const EdgeInsets.only(
                              left: 5
                            ),
                            child: Text(
                              index == 0 ? 'All' : 'Education',
                              style: MyFontStyle.boldStyle(15,index != currentSelected
                                  ?Colors.grey.shade700
                                  : Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ));
          },
          itemCount: 15,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
