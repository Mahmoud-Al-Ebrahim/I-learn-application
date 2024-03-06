import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/font_style.dart';

import '../../../../Helper/app_color.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.scaffoldBackGroundColor,
              pinned: true,
              collapsedHeight: 250,
              flexibleSpace: Column(
                children: [
                  Image.asset(
                    'assets/preview.jpg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      'E-commerce Project',
                      textAlign: TextAlign.center,
                      style: MyFontStyle.boldStyle(25, AppColors.primaryColor[50]!)
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                )),
            SliverToBoxAdapter(
              child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                'widget can be use in between two widget to add space between two widget and it makes code more readable than padding widget widget can be use in between two widget to add space between two widget and it makes code more readable than padding widget',
                style: MyFontStyle.boldStyle(18, Colors.black)
                      .copyWith(height: 1.5),
              ),
                  )),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            SliverToBoxAdapter(
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                      'This Project needs 4 persons under the following title:',
                      style: MyFontStyle.boldStyle(
                          20, AppColors.primaryColor[50]!)),
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Back-end developer',
                            style: MyFontStyle.boldStyle(
                                18, AppColors.accentColor[50]!)),
                        Text('Register',
                            style: MyFontStyle.boldStyle(
                                18, AppColors.accentColor[50]!)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Front-end developer',
                            style: MyFontStyle.boldStyle(
                                18, AppColors.primaryColor[50]!)),
                        Icon(Icons.check,
                            size: 30, color: AppColors.primaryColor[50]!)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mobile developer',
                            style: MyFontStyle.boldStyle(
                                18, AppColors.accentColor[50]!)),
                        Text('Register',
                            style: MyFontStyle.boldStyle(
                                18, AppColors.accentColor[50]!)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('UI/UX designer',
                            style: MyFontStyle.boldStyle(
                                18, AppColors.primaryColor[50]!)),
                        Icon(Icons.check,
                            size: 30, color: AppColors.primaryColor[50]!)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                )),
            SliverToBoxAdapter(
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                      'When the project requirement completed we will contact with you.',
                      textAlign: TextAlign.center,
                      style: MyFontStyle.boldStyle(
                          20, Colors.deepOrange)),
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                )),
            SliverToBoxAdapter(
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                      'Stay tuned!😊',
                      textAlign: TextAlign.center,
                      style: MyFontStyle.boldStyle(
                          20, Colors.deepOrange)),
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                )),
          ],
        ),
      ),
    );
  }
}
