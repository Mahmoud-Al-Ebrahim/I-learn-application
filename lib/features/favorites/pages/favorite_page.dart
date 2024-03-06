import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/search/Presentation/save_items/save_item_cubit.dart';

import '../../home/presentation/widgets/course_Card.dart';
import '../../search/Presentation/save_items/save_item_state.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage(this.response,{Key? key}) : super(key: key);
final response;
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackGroundColor,
          title: Text(
            'My Favorite Cources',
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
        body: BlocBuilder<SaveItemCubit, SaveItemState>(
            builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CourseCard(true, 0,index,widget.response),
                );
              },
              scrollDirection: Axis.vertical,
              itemCount: context.read<SaveItemCubit>().saved.length,
            ),
          );
        }));
  }
}
