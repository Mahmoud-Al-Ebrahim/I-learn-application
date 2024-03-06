import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/global_widget/app_chips.dart';
import 'package:graduation_project/global_widget/custom_button.dart';
import '../../../../Helper/app_color.dart';
import '../../../../Helper/helper_requests.dart';
import '../../../../loader.dart';
import '../widgets/expandable_item.dart';
import 'dart:convert' as convert;

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late final ValueNotifier<bool> checkDiscount;
  bool flag = false;
  late final response;
  List<ValueNotifier<bool>>  list=List.generate(7, (index) => ValueNotifier(false));
  @override
  void initState() {
    checkDiscount = ValueNotifier(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!flag) {
      makeRequest();
    }
    return flag
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primaryColor[50]!,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              backgroundColor: AppColors.scaffoldBackGroundColor,
              title: Text(
                'Filter',
                style: MyFontStyle.boldStyle(20, AppColors.primaryColor[50]!),
              ),
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        ExpandableItem(
                            'Levels',
                            Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ValueListenableBuilder<bool>(
                                      valueListenable: list[4],
                                      builder: (context, nreSelected, child) {
                                        return InkWell(
                                          onTap: (){
                                            list[4].value=!list[4].value;
                                          },
                                          child:AppChips(
                                            isSelected: nreSelected,
                                              text: response['levels'][0]['translation']
                                              ['name']),
                                        );
                                      }),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ValueListenableBuilder<bool>(
                                      valueListenable: list[5],
                                      builder: (context, nreSelected, child) {
                                        return InkWell(
                                          onTap: (){
                                            list[5].value=!list[5].value;
                                          },
                                          child:AppChips(
                                              isSelected: nreSelected,
                                              text: response['levels'][1]['translation']
                                              ['name']),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ValueListenableBuilder<bool>(
                                      valueListenable: list[6],
                                      builder: (context, nreSelected, child) {
                                        return InkWell(
                                          onTap: (){
                                            list[6].value=!list[2].value;
                                          },
                                          child:AppChips(
                                              isSelected: nreSelected,
                                              text: response['levels'][2]['translation']
                                              ['name']),
                                        );
                                      }),
                                ),
                              ],
                            )),
                        const Divider(thickness: 1.5, height: 0),
                        const SizedBox(
                          height: 10,
                        ),
                        ExpandableItem(
                            'Categories',
                            Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ValueListenableBuilder<bool>(
                                      valueListenable: list[0],
                                      builder: (context, nreSelected, child) {
                                        return InkWell(
                                          onTap: (){
                                            list[0].value=!list[0].value;
                                          },
                                          child: AppChips(
                                              isSelected: nreSelected,
                                              text: response['categories'][0]
                                                  ['translation']['name']),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ValueListenableBuilder<bool>(
                                      valueListenable: list[1],
                                      builder: (context, nreSelected, child) {
                                        return InkWell(
                                          onTap: (){
                                            list[1].value=!list[1].value;
                                          },
                                          child: AppChips(
                                              isSelected: nreSelected,
                                              text: response['categories'][1]
                                              ['translation']['name']),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ValueListenableBuilder<bool>(
                                      valueListenable: list[2],
                                      builder: (context, nreSelected, child) {
                                        return InkWell(
                                          onTap: (){
                                            list[2].value=!list[2].value;
                                          },
                                          child: AppChips(
                                              isSelected: nreSelected,
                                              text: response['categories'][2]
                                              ['translation']['name']),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ValueListenableBuilder<bool>(
                                      valueListenable: list[3],
                                      builder: (context, nreSelected, child) {
                                        return InkWell(
                                          onTap: (){
                                            list[3].value=!list[3].value;
                                          },
                                          child: AppChips(
                                              isSelected: nreSelected,
                                              text: response['categories'][3]
                                              ['translation']['name']),
                                        );
                                      }),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            buttonColor: AppColors.primaryColor[50]!,
                            content: Text(
                              'Apply',
                              style: MyFontStyle.boldStyle(
                                  20, AppColors.scaffoldBackGroundColor),
                            ),
                            onPressed: () {},
                            width: double.infinity),
                      ],
                    ),
                  )
                ])))
        : Scaffold(
            backgroundColor: AppColors.scaffoldBackGroundColor,
            body: Center(child: Loader()));
  }

  void makeRequest() async {
    final url = Uri.parse(
        'https://wl-materials-service.herokuapp.com/api/v1/courses/search');
    await Helpers.getRequest(url);
    print(Helpers.currentResponse.body);
    response = convert.jsonDecode(Helpers.currentResponse.body);
    setState(() {
      flag = true;
    });
  }
}
