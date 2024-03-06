import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/features/filter/presentation/pages/filter.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:3 ,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const FilterScreen()));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
        color: AppColors.primaryColor[25],
        borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
          child:SvgPicture.asset('assets/home/filter_icon.svg',
            height: MediaQuery.of(context).size.height * 0.02,
          )
          )),
      ),
    );
  }
}
