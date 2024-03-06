import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 15) ,
        padding: const EdgeInsets.all(12),
      decoration:
      BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all( Radius.circular(12)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0,0)
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0,0)
                )
              ],
             borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
                borderRadius:  BorderRadius.circular(15),
                child: Image.asset('assets/404_developers_logo.png')),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('UI/UX Design', style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                    fontSize: 20
                )),
                  const SizedBox(height: 15),
                  const SizedBox(height: 10),
                  LinearPercentIndicator(
                    lineHeight: 15.0,
                    percent: 0.6,
                    center: Text('60%',style: TextStyle(
                      color: Colors.white
                    ),),
                    animation: true,
                    barRadius: Radius.circular(5),
                    backgroundColor: Colors.grey.shade200,
                    progressColor: AppColors.primaryColor,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
