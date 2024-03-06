import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/features/home/presentation/pages/home_screen.dart';
import 'package:graduation_project/features/home/presentation/providers/bottom%20naviagtion%20bar.dart';
import 'package:graduation_project/features/progress_page/progress_page.dart';

import '../../../profile/presentation/pages/profile.dart';
import '../../../search/Presentation/pages/search.dart';

class myBottomNavigationBar extends StatefulWidget {
  const myBottomNavigationBar(this.response,{Key? key}) : super(key: key);
  final response;
  @override
  State<myBottomNavigationBar> createState() => _myBottomNavigationBarState();
}

class _myBottomNavigationBarState extends State<myBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: InkWell(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
            context.read<BottomNavigationBarItemProvider>().indexChanged(0);
          },
          child: const Icon(Icons.home_outlined,
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> Search(widget.response)));
            context.read<BottomNavigationBarItemProvider>().indexChanged(1);
          },
          child: const Icon(Icons.search,
          ),
        ),
        label: '',
      ),
       BottomNavigationBarItem(
        icon: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> ProgressPage(widget.response)));
            context.read<BottomNavigationBarItemProvider>().indexChanged(2);
          },
          child:const Icon(Icons.play_lesson_rounded,
          ),
        ),
        label: '',
      ),
       BottomNavigationBarItem(
        icon: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> Profile(widget.response)));
            context.read<BottomNavigationBarItemProvider>().indexChanged(3);
          },
          child: Icon(Icons.person_rounded,
          ),
        ),
        label: '',
      ),
    ],
    currentIndex: context.read<BottomNavigationBarItemProvider>().getIndex(),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.accentColor.withOpacity(0.4),
    );
  }
}
