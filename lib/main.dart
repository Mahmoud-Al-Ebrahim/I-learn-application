import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/fetch_image/fetch_image_cubit.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/focus_node_cubit/focus_node_cubit.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/password_visible/password_visible_cubit.dart';
import 'package:graduation_project/features/authentication/Presentation/Pages/login_screen.dart';
import 'package:graduation_project/features/authentication/Presentation/Pages/sign_up_screen.dart';
import 'package:graduation_project/features/home/presentation/providers/bottom%20naviagtion%20bar.dart';
import 'package:provider/provider.dart';
import 'features/on_boarding/Presentation/cubit/navigation_cubit.dart';
import 'features/on_boarding/Presentation/pages/on_boarding_screen.dart';
import 'features/search/Presentation/save_items/save_item_cubit.dart';

void main() {
  runApp(const GraduationProject());
}

class GraduationProject extends StatelessWidget {

  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  const GraduationProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarItemProvider()),
      ],
      child: MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context)=>NavigationCubit(),
        ),
        BlocProvider<FocusNodeCubit>(
          create: (context)=>FocusNodeCubit(),
        ),
        BlocProvider<SaveItemCubit>(
          create: (context)=>SaveItemCubit(),
        ),
        BlocProvider<PasswordVisibleCubit>(
          create: (context)=>PasswordVisibleCubit(),
        ),
        BlocProvider<FetchImageCubit>(
          create: (context)=>FetchImageCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor
        ),
        home:   const OnBoardingScreen(),
        routes: {
          OnBoardingScreen.routeName:(context)=>const OnBoardingScreen(),
          SignUpScreen.routeName:(context)=>const SignUpScreen(),
          LoginScreen.routeName:(context)=>const LoginScreen(),
        },
      ),
      ),
    );
  }
}