import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/features/competitions/competition_implement/screens/multiChoicesScreen/multi_choices_screen.dart';
import 'package:graduation_project/features/competitions/competition_implement/true_false_screen/true_false_screen.dart';
import 'package:graduation_project/features/competitions/presentation/pages/competition_score_board.dart';
import 'package:graduation_project/global_widget/custom_button.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';

class CompetitionDetails extends StatefulWidget {
  const CompetitionDetails({this.isTrueFalse=false,this.enabled=true,Key? key}) : super(key: key);
    final bool enabled;
    final bool isTrueFalse;
  @override
  State<CompetitionDetails> createState() => _CompetitionDetailsState();
}

class _CompetitionDetailsState extends State<CompetitionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
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
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: 650,
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.scaffoldBackGroundColor),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      'assets/ranking.svg',
                      height: 250,
                    ),
                    Text(
                      'participate in Entertainment and interactive Contests To Increase your Rating and grow up with your Skill',
                      textAlign: TextAlign.center,
                      style: MyFontStyle.bookStyle(25, AppColors.primaryColor[50]!),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'your rate will change if you participate in the first 24 hours!',
                      textAlign: TextAlign.center,
                      style: MyFontStyle.bookStyle(25, Colors.deepOrange),
                    ),
                    const SizedBox(height: 20,),
                    !widget.enabled? Column(
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Remaining Time: ',
                              style: MyFontStyle.boldStyle(
                                  20, AppColors.accentColor[50]!.withOpacity(0.7)),
                            ),
                            TextSpan(
                              text: '00:34:19',
                              style: MyFontStyle.boldStyle(
                                  20, AppColors.primaryColor[50]!),
                            )
                          ]),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ):Container(),
                    CustomButton(
                      buttonColor: widget.enabled? AppColors.primaryColor[50]!:Colors.grey,
                        content: Text(
                          'Start',
                          textAlign: TextAlign.center,
                          style: MyFontStyle.bookStyle(25, Colors.white),
                        ),
                        onPressed: widget.enabled ? () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                          if(widget.isTrueFalse){
                            return TrueFalsePage();
                        }
                          else{
                            return MultiChoicesPage();
                          }
                        }));
                        } :(){},
                        width: 300),
                    const SizedBox(height: 30,),
                    widget.enabled ?  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const CompetitionScoreBoard()));
                      },
                      child: Text(
                        'Check Current ScoreBoard',
                        textAlign: TextAlign.center,
                        style: MyFontStyle.bookStyle(20,AppColors.primaryColor[50]!),
                      ),
                    ): Container(),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0,30),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primaryColor[50]!,)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
