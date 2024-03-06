import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:graduation_project/Helper/font_style.dart';

import '../../../../Helper/app_color.dart';

class Categories extends StatefulWidget {
  const Categories(this.response,this.function,{Key? key}) : super(key: key);

  final  response;
  final  Function(int) function;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  ValueNotifier<int> selectedCategory = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder<int>(
        valueListenable: selectedCategory,
        builder: (context, newselectedCategory, _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(
                      right: size.width * 0.03,
                      top: size.width * 0.02,
                      left: size.width * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          if(widget.response[index]['featured_materials'].length!=0)
                          widget.function(index);
                          selectedCategory.value=index;
                        },
                        child: Container(
                          width: size.height * 0.08,
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: (newselectedCategory != index)
                                ? [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: const Offset(0, 0))
                                  ]
                                : null,
                            color: newselectedCategory!=index?Colors.white:AppColors.primaryColor[50]!,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.category_outlined,
                              color:newselectedCategory!=index? Colors.grey.shade600:Colors.white,
                              size: size.height * 0.06,
                            ),
                          ),
                        ),
                      ),
                      Text(
                      widget.response[index]['translation']['name'],
                        style: MyFontStyle.boldStyle(15, Colors.grey.shade700),
                      )
                    ],
                  ));
            },
            itemCount: widget.response.length,
            scrollDirection: Axis.horizontal,
          );
        });
  }
}
