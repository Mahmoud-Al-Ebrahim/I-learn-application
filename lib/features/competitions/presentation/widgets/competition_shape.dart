import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/competitions/presentation/widgets/competetion_details.dart';

class CompetitionShape extends StatefulWidget {
  const CompetitionShape(
      {required this.imageUrl, required this.contestTitle, Key? key})
      : super(key: key);

  final String imageUrl;
  final String contestTitle;

  @override
  State<CompetitionShape> createState() => _CompetitionShapeState();
}

class _CompetitionShapeState extends State<CompetitionShape> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 0))
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    widget.imageUrl,
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.contestTitle,
                      style: MyFontStyle.boldStyle(
                          25, AppColors.primaryColor[50]!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Round: ',
                          style: MyFontStyle.boldStyle(
                              20, AppColors.accentColor[50]!),
                        ),
                        TextSpan(
                          text: '#113',
                          style: MyFontStyle.boldStyle(
                              20, AppColors.primaryColor[50]!),
                        )
                      ]),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Status: ',
                  style: MyFontStyle.boldStyle(20, AppColors.accentColor[50]!),
                ),
                TextSpan(
                  text: 'Start after 02:13:22',
                  style: MyFontStyle.boldStyle(20, AppColors.primaryColor[50]!),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Level: ',
                  style: MyFontStyle.boldStyle(20, AppColors.accentColor[50]!),
                ),
                TextSpan(
                  text: 'Medium',
                  style: MyFontStyle.boldStyle(20, AppColors.primaryColor[50]!),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Number of participants: ',
                  style: MyFontStyle.boldStyle(20, AppColors.accentColor[50]!),
                ),
                TextSpan(
                  text: '12398',
                  style: MyFontStyle.boldStyle(20, AppColors.primaryColor[50]!),
                )
              ]),
            ),
          ],
        ),
    );
  }
}
