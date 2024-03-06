
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/drawer/presentation/pages/my_drawer.dart';
import 'dart:convert' as convert;
import '../../../../Helper/helper_requests.dart';
import '../../../../loader.dart';
import '../widgets/categories.dart';
import '../widgets/featured_section.dart';
import '../widgets/myBottom_navigation_bar.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/recommended_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/Home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

   var response=null;
 bool flag=false;
 int index=0;
  @override
  Widget build(BuildContext context) {
    if(!flag) {
      makeRequest();
    }
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar:  myBottomNavigationBar(response),
      drawer:  MyDrawer(response),
      body: flag? SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: size.height * 0.06,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: size.width * 0.05,
                    ),
                    child: const MyAppBar(),
                  )),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.03,
                ),
                child: SizedBox(
                    height: size.height * 0.13, child:  Categories(response,(int x){
                      index=x;
                      setState(() {

                      });
                })),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.03,
                ),
                child: Text(
                  'Featured',
                  style: MyFontStyle.boldStyle(25, Colors.grey.shade800),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                  ),child:  FeaturedSection(response,index)),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: size.height * 0.03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: MyFontStyle.boldStyle(25, Colors.grey.shade800),
                ),
                Text(
                  'See all',
                  style: MyFontStyle.boldStyle(15, Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
              top: size.width * 0.03,
            ),
            child: SizedBox(
                height: size.height * 0.16, child:  RecommendedSection(response))),
            ],
          ),
        ),
      ):Center(
        child: Loader(),
      ),
    );
  }



  void makeRequest()async {
    final url = Uri.parse('https://wl-materials-service.herokuapp.com/api/v1/pages/home_page');
    await Helpers.getRequest(url);
    print(Helpers.currentResponse.body);
    response= convert.jsonDecode(Helpers.currentResponse.body);
       setState(() {
         flag=true;
    });
  }
}
