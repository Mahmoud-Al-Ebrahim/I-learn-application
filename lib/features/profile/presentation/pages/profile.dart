import 'package:flutter/material.dart';

import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
import '../../../../global_widget/custom_button.dart';
import '../../../home/presentation/widgets/myBottom_navigation_bar.dart';
import 'edit_profile_page.dart';

class Profile extends StatefulWidget {
  const Profile(this.response,{Key? key}) : super(key: key);
final response;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: myBottomNavigationBar(widget.response),
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
          ))),
          Container(
            width: size.width*0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30,),
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                          width: size.height * 0.15,
                          height: size.height * 0.15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/profile.png')))),
                      SizedBox(
                        width: size.width * 0.4,
                        child: Text(
                          'Marco',
                          textAlign: TextAlign.center,
                          style: MyFontStyle.bookStyle(
                              size.height * 0.03,  AppColors.primaryColor[50]!),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: SizedBox(
                          width: size.width * 0.4,
                          child: Text(
                            'master',
                            textAlign: TextAlign.center,
                            style: MyFontStyle.boldStyle(
                                size.height * 0.02, Colors.amber),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Rate:',
                              textAlign: TextAlign.center,
                              style: MyFontStyle.boldStyle(
                                  size.height * 0.02, Colors.amber),
                            ),
                            Text(
                              '2103',
                              textAlign: TextAlign.center,
                              style: MyFontStyle.boldStyle(
                                  size.height * 0.02, Colors.amber),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height:20),
                      SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Max Rate:',
                              textAlign: TextAlign.center,
                              style: MyFontStyle.boldStyle(
                                  size.height * 0.02, Colors.amberAccent),
                            ),
                            Text(
                              '2113',
                              textAlign: TextAlign.center,
                              style: MyFontStyle.boldStyle(
                                  size.height * 0.02, Colors.amberAccent),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                CustomButton(
                    width: size.width*0.7,
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>  EditProfilePage(widget.response)));
                  },
                  buttonColor: AppColors.primaryColor[50]!,
                  content:  Text(
                    'Edit Profile',
                    textAlign: TextAlign.center,
                    style: MyFontStyle.boldStyle(
                        size.height * 0.02, Colors.white),
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
