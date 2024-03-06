import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/global_widget/custom_button.dart';

class CompetitionScoreBoard extends StatefulWidget {
  const CompetitionScoreBoard({Key? key}) : super(key: key);

  @override
  State<CompetitionScoreBoard> createState() => _CompetitionScoreBoardState();
}

class _CompetitionScoreBoardState extends State<CompetitionScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            AppColors.primaryColor[50]!,
            AppColors.primaryColor[50]!.withOpacity(0.7),
            AppColors.primaryColor[50]!.withOpacity(0.4),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: const [0.0, 0.3, 1.0],
          tileMode: TileMode.clamp,
        )),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children:  [
                              Text(
                                'Rank',
                                style: MyFontStyle.boldStyle(16, Colors.amber)
                              ),
                             const  SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Contestant',
                                  style: MyFontStyle.boldStyle(16, Colors.amber)
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text(
                                'AC',
                                  style: MyFontStyle.boldStyle(16, Colors.amber)
                              ),
                              Text(
                                'WA',
                                  style: MyFontStyle.boldStyle(16, Colors.amber)
                              ),
                              Text(
                                'Time',
                                  style: MyFontStyle.boldStyle(16, Colors.amber)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                  height: 800,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 210.0),
                    child: ListView.builder(
                        itemCount: 25,
                        itemBuilder: (_,index)=> Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                          (index+1).toString(),
                                    style: MyFontStyle.boldStyle(
                                        12, AppColors.scaffoldBackGroundColor),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/profile.png',
                                        fit: BoxFit.contain,
                                        height: 30,
                                        width: 30,
                                      ),
                                      Text(
                                        'contestant name',
                                        style: MyFontStyle.boldStyle(
                                            14, AppColors.scaffoldBackGroundColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '37',
                                  style: MyFontStyle.boldStyle(
                                      14, AppColors.scaffoldBackGroundColor),
                                ),
                                Text(
                                  '12',
                                  style: MyFontStyle.boldStyle(
                                      14, AppColors.scaffoldBackGroundColor),
                                ),
                                Text(
                                  '03:47',
                                  style: MyFontStyle.boldStyle(
                                      14, AppColors.scaffoldBackGroundColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ) ),
                  ),
                    ),
                ],
              ),
            ),
            const SizedBox(
                height: 20
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CustomButton(
                  buttonColor: Colors.amber,
                  content: Text('back',style: MyFontStyle.boldStyle(25, AppColors.primaryColor[50]!),), onPressed: (){
                Navigator.pop(context);
              }, width: double.infinity),
            ),
            const SizedBox(
                height: 50
            ),
          ],
        ),
      ),
    );
  }
}
