import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/course_details/course_details_page.dart';
import 'package:graduation_project/features/home/presentation/widgets/description_item.dart';
import '../../../search/Presentation/save_items/save_item_cubit.dart';
import '../../../search/Presentation/save_items/save_item_state.dart';

class CourseCard extends StatefulWidget {
  final bool fromSearch;
  final int? index;
  final int? categoryIndex;
  final response;

  const CourseCard(this.fromSearch,this.categoryIndex, this.index, this.response, {Key? key})
      : super(key: key);

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetailsPage(widget.index!,widget.response)));
      },
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.013, horizontal: size.width * 0.02),
          width: size.width * 0.9,
          height: size.height * 0.35,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 0))
              ],
              borderRadius: BorderRadius.circular(size.width * 0.05)),
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage((widget.index!) % 3 == 0
                            ? 'assets/preview.jpg'
                            : (widget.index!) % 3 == 1
                                ? 'assets/data/img.png'
                                : 'assets/data/img_1.png'),
                      ),
                      borderRadius: BorderRadius.circular(size.width * 0.05)),
                ),
                BlocBuilder<SaveItemCubit, SaveItemState>(
                    builder: (context, state) {
                  return widget.fromSearch
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Transform.translate(
                            offset:
                                Offset(-size.width * 0.06, size.height * 0.03),
                            child: InkWell(
                              onTap: () {
                                if ((state as SaveItemChanged)
                                    .saved
                                    .contains(widget.index)) {
                                  context
                                      .read<SaveItemCubit>()
                                      .removeItem(widget.index!);
                                } else {
                                  context
                                      .read<SaveItemCubit>()
                                      .addItem(widget.index!);
                                }
                              },
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: ((state as SaveItemChanged)
                                          .saved
                                          .contains(widget.index))
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/profile/save_icon.svg',
                                        color: !(state as SaveItemChanged)
                                                .saved
                                                .contains(widget.index)
                                            ? AppColors.primaryColor
                                            : Colors.white)),
                              ),
                            ),
                          ))
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Transform.translate(
                            offset:
                                Offset(-size.width * 0.06, size.height * 0.03),
                            child: Container(
                              width: size.width * 0.2,
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.07)),
                              child: Center(
                                child: Text(
                                  '\$110.00',
                                  style: MyFontStyle.boldStyle(
                                      size.width * 0.04, Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                })
              ]),
            ),
            SizedBox(
              height: size.height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Text(
                        widget.response[widget.categoryIndex]['featured_materials'][widget.index]['translation']['name'],
                      style: MyFontStyle.boldStyle(25, Colors.grey.shade800),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        widget.fromSearch ? Spacer() : Container(),
                        widget.fromSearch
                            ? DescriptionItem(
                                icon: Icons.price_change_outlined,
                                value: '100',
                                color: Colors.grey.shade400,
                                flex: 3,
                              )
                            : Container(),
                        Spacer(),
                        DescriptionItem(
                          icon: Icons.not_started_outlined,
                          value: '6 ',
                          color: Colors.grey.shade400,
                          title: 'lessons',
                          flex: widget.fromSearch ? 5 : 6,
                        ),
                        Spacer(),
                        DescriptionItem(
                          icon: Icons.access_time,
                          value: '10',
                          color: Colors.grey.shade400,
                          title: 'hours',
                          flex: widget.fromSearch ? 4 : 5,
                        ),
                        Spacer(),
                        DescriptionItem(
                          icon: Icons.star,
                          value: '4.5 ',
                          color: Colors.yellowAccent,
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
