import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class LoginCircleOption extends StatelessWidget {
  const LoginCircleOption({Key? key,required this.iconUrl}) : super(key: key);
final String iconUrl;
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return InkWell(
      onTap: (){},
        child:Container(
          width: size.width*0.12,
          height: size.width*0.12,
          decoration: const BoxDecoration(
              shape: BoxShape.circle
          ),
          child: SvgPicture.asset(iconUrl),
        )
    );
  }
}
