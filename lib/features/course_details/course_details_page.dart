import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/features/course_details/vedio_player.dart';
import 'package:graduation_project/features/payment/add_card_content.dart';
import '../../Helper/font_style.dart';
import '../../global_widget/app_bottom_sheet.dart';
import '../../global_widget/custom_button.dart';
import '../home/presentation/widgets/description_item.dart';
import '../search/Presentation/save_items/save_item_cubit.dart';
import '../search/Presentation/save_items/save_item_state.dart';
import 'lesson_section.dart';
class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage(this.index,this.response,{Key? key}) : super(key: key);
 final response;
 final int index;
  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  bool visible = false;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (visible) {
        setState(() {
          visible = !visible;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 5),
              width: double.infinity,
              height: 70,
              color: AppColors.scaffoldBackGroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '\$110.00',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ],
                  ),
                  CustomButton(
                    width: size.width * 0.5,
                    buttonColor: AppColors.primaryColor,
                    onPressed: () {
                      AppBottomSheet.show(
                        context: context,
                        child: const AddCardContent()
                      );
                    },
                    content: const Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text(
                'Details',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black87,
                ),
              ),
              backgroundColor: AppColors.scaffoldBackGroundColor,
            ),
            body: CustomScrollView(
              physics:const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.scaffoldBackGroundColor,
                  floating: true,
                  leadingWidth: 0,
                  elevation: 0,
                  leading: SizedBox(),
                  collapsedHeight: 200,
                  flexibleSpace: MYVideoPlayer(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'UI/UX Design',
                          style:
                              MyFontStyle.boldStyle(25, Colors.grey.shade800),
                        ),
                        BlocBuilder<SaveItemCubit,SaveItemState>(
                            builder: (context,state) {
                              return
                              Align(alignment: Alignment.bottomRight,
                                  child: Transform.translate(
                                    offset: Offset(-size.width * 0.06, size.height * 0.03),
                                    child:  InkWell(
                                      onTap: (){
                                        if ((state as SaveItemChanged).saved.contains(widget.index)) {
                                          context.read<SaveItemCubit>().removeItem(widget.index);
                                        }
                                        else{
                                          context.read<SaveItemCubit>().addItem(widget.index);
                                        }
                                      },child:Container(
                                      width: size.width * 0.2,
                                      height: size.height * 0.06,
                                      decoration: BoxDecoration(
                                        color:((state as SaveItemChanged).saved.contains(widget.index))?AppColors.primaryColor:Colors.white,
                                        shape: BoxShape.circle,),
                                      child: Center(
                                          child: SvgPicture.asset(
                                              'assets/profile/save_icon.svg',
                                              color: !(state as SaveItemChanged).saved.contains(widget.index)?AppColors.primaryColor:Colors.white)
                                      ),
                                    ),
                                    ),
                                  ));})
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12, bottom: 12),
                    child: Expanded(
                      child: Row(
                        children: [
                          DescriptionItem(
                            icon: Icons.not_started_outlined,
                            value: '6 ',
                            color: Colors.grey.shade400,
                            title: 'lessons',
                            flex: 1,
                          ),
                          DescriptionItem(
                            icon: Icons.access_time,
                            value: '10 ',
                            color: Colors.grey.shade400,
                            title: 'hours',
                            flex: 1,
                          ),
                          Visibility(
                            child: RatingBar.builder(
                              initialRating: 0,
                              itemCount: 5,
                              itemSize: 20,
                              glowColor: Colors.white,
                              updateOnDrag: true,
                              tapOnlyMode: true,
                              unratedColor: Colors.grey,
                              itemBuilder: (context, index) {
                                return const Icon(Icons.star_rounded,
                                    color: Colors.yellow);
                              },
                              glow: true,
                              onRatingUpdate: (rating) {
                                setState(() {
                                  visible = true;
                                });
                              },
                              allowHalfRating: true,
                            ),
                            visible: visible,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            child: Visibility(
                              visible: !visible,
                              child: const DescriptionItem(
                                icon: Icons.star,
                                value: '4.5 ',
                                color: Colors.yellowAccent,
                                flex: 1,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12, bottom: 12),
                    child: Text(
                      'About Course',
                      style: MyFontStyle.boldStyle(20, Colors.grey.shade800),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12,
                    ),
                    child: Text(
                      'widget can be use in between two widget to add space between two widget and it makes code more readable than padding widget',
                      style: MyFontStyle.lightStyle(14, Colors.grey.shade500),
                    ),
                  ),
                ),
                const SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.scaffoldBackGroundColor,
                  flexibleSpace: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        child: Text('Lessons',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 20)),
                      ),
                      Tab(
                        child: Text('Exercises',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20)),
                      )
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      LessonSection(),
                      LessonSection(),
                    ],
                  ),
                ),
              ],
            )));
  }
}
