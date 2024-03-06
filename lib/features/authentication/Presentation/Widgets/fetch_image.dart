import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import '../Blocs/fetch_image/fetch_image_cubit.dart';
import '../Blocs/fetch_image/fetch_image_state.dart';



class FetchImage extends StatefulWidget {
  const FetchImage({Key? key}) : super(key: key);

  @override
  _FetchImageState createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: size.height*0.02),
      child: InkWell(
        onTap: (){
          context.read<FetchImageCubit>().fetchImage();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.15,
              child: BlocBuilder<FetchImageCubit, FetchImageState>(
                builder: (context, state) {
                  if (state is FetchImageInitial) {
                    return SvgPicture.asset(
                      'assets/auth_icons/add_photo_default.svg',
                    );
                  } else if (state is FetchImageDone) {
                    return Image.file(
                      File(state.imageUrl.path),
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:size.width*0.03),
              child: SizedBox(
                width: size.width*0.53,
                child: Text('Upload a profile picture',
                    style: MyFontStyle.bookStyle(18, AppColors.accentColor[150]!)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
