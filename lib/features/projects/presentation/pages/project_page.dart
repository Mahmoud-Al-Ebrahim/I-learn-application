import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/projects/presentation/widgets/my_calendar.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late final ValueNotifier<int> currentActive;

  @override
  void initState() {
    // TODO: implement initState
    currentActive = ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackGroundColor,
          elevation: 0,
          title: Text(
            'Projects Schedule',
            style: MyFontStyle.boldStyle(25, AppColors.accentColor[50]!),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.accentColor[50]!,
              size: 25,
            ),
          ),
        ),
        body: ValueListenableBuilder<int>(
            valueListenable: currentActive,
            builder: (context, newCurrentActive, child) {
              return Column(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          currentActive.value = 0;
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: newCurrentActive == 0
                                  ? AppColors.primaryColor[50]!
                                  : null,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: newCurrentActive == 0
                                      ? Colors.white
                                      : AppColors.accentColor[50]!,
                                  width: 1)),
                          child: Text(
                            'This Week',
                            style: MyFontStyle.bookStyle(
                                15,
                                newCurrentActive != 0
                                    ? AppColors.accentColor[50]!
                                    : Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentActive.value = 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: newCurrentActive == 1
                                  ? AppColors.primaryColor[50]!
                                  : null,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: newCurrentActive == 1
                                      ? Colors.white
                                      : AppColors.accentColor[50]!,
                                  width: 1)),
                          child: Text(
                            'This month',
                            style: MyFontStyle.bookStyle(
                                15,
                                newCurrentActive != 1
                                    ? AppColors.accentColor[50]!
                                    : Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentActive.value = 2;
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: newCurrentActive == 2
                                  ? AppColors.primaryColor[50]!
                                  : null,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: newCurrentActive == 2
                                      ? Colors.white
                                      : AppColors.accentColor[50]!,
                                  width: 1)),
                          child: Text(
                            'Today',
                            style: MyFontStyle.bookStyle(
                                15,
                                newCurrentActive != 2
                                    ? AppColors.accentColor[50]!
                                    : Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentActive.value = 3;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: newCurrentActive == 3
                                  ? AppColors.primaryColor[50]!
                                  : null,
                              border: Border.all(
                                  color: newCurrentActive == 3
                                      ? Colors.white
                                      : AppColors.accentColor[50]!,
                                  width: 1)),
                          child: SvgPicture.asset(
                            'assets/home/filter_icon.svg',
                            color: newCurrentActive != 3
                                ? AppColors.accentColor[50]!
                                : Colors.white,
                            height: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: MyCalendar(newCurrentActive: newCurrentActive,)),
                ],
              );
            }));
  }
}
