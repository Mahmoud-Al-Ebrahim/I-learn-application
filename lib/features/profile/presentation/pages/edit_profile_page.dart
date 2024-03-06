import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
import '../../../../global_widget/app_text_field.dart';
import '../../../../global_widget/custom_button.dart';
import '../../../../utils/validator.dart';
import '../../../authentication/Presentation/Widgets/fetch_image.dart';
import '../../../home/presentation/widgets/myBottom_navigation_bar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(this.response,{Key? key}) : super(key: key);
final response;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar:  myBottomNavigationBar(widget.response),
      body: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: AppColors.accentColor[50]!,
              )),
        ),
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
        ))),
        Container(
            width: size.width * 0.95,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const FetchImage(),
                const SizedBox(
                  height: 20,
                ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              child: Form(
                  key: key,
                  child: AppTextField(
                    textInputType: TextInputType.text,
                    hintText: 'User name',
                    validator: requiredValidator(),
                    controller: controller,
                    maxLines: 1,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'assets/card/person.svg',
                        color: AppColors.primaryColor[50]!,
                      ),
                    ),
                  ),
                ),),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  width: size.width * 0.7,
                  onPressed: () {},
                  buttonColor: AppColors.primaryColor[50]!,
                  content: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style:
                        MyFontStyle.boldStyle(size.height * 0.02, Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
      ]),
    );
  }
}
