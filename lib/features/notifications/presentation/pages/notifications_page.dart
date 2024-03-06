import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      appBar: AppBar(
        backgroundColor:  AppColors.scaffoldBackGroundColor,
        title: Text('Notification',
            style: MyFontStyle.boldStyle(22, AppColors.accentColor[50]!)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
            color: AppColors.accentColor[50]!,
          ),
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Transform.translate(
              offset: const Offset(-16, 0),
              child: Text(
                'Read all',
                style: MyFontStyle.bookStyle(12, AppColors.primaryColor[50]!),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
              children: [
                NotificationItem(index: index,),
                Divider(
                  height: 0,
                  indent: 25,
                  endIndent: 25,
                ),
              ],
            );
          }))
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color(0xFFFBFDFD),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      child: Row(
        children: [
          SvgPicture.asset('assets/home/notification_icon.svg'),
          const SizedBox(width: 10,),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                     'project Info',
                    style: MyFontStyle.boldStyle(16, AppColors.primaryColor[50]!).copyWith(height: 1.1)),
                const SizedBox(height: 7,),
                Text(
                     'the project will getting started in 9/11/2022',
                    style:MyFontStyle.boldStyle(12, AppColors.accentColor[50]!),),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                       '12:25 PM',
                      style: MyFontStyle.bookStyle(12, Colors.grey.shade400),),
                    Text(
                      'Today',
                      style: MyFontStyle.bookStyle(12, Colors.grey.shade400),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
