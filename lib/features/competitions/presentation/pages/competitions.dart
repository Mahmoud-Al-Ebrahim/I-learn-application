import 'package:flutter/material.dart';
import 'package:graduation_project/features/competitions/presentation/widgets/competition_shape.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
import '../widgets/competetion_details.dart';

class Competitions extends StatelessWidget {
  const Competitions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        elevation: 0,
        title: Text(
          'Competitions Schedule',
          style: MyFontStyle.boldStyle(25, AppColors.accentColor[50]!),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.accentColor[50]!,
            size: 25,
          ),
        ),
      ),
      backgroundColor: AppColors.scaffoldBackGroundColor,
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CompetitionDetails(
                                  enabled: (index % 2 == 0),
                              isTrueFalse: (index <5),
                                )));
                  },
                  child: CompetitionShape(
                    contestTitle:
                        index > 5 ? 'Multiple Choices' : 'True or False?',
                    imageUrl:
                        index > 5 ? 'assets/multiple.png' : 'assets/test.png',
                  ));
            },
            childCount: 10,
          ))
        ],
      ),
    );
  }
}
