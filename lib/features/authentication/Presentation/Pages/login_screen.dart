import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/already_have_account.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/auth_button.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/custom_text_input.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/login_header.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/login_section.dart';
import 'dart:convert' as convert;
import '../../../../Helper/helper_requests.dart';
import '../../../../end_points_configuration/auth/auth_config.dart';
import '../../../../end_points_configuration/server/server_config.dart';
import '../../../../loading_page.dart';
import '../../../../toast.dart';
import '../../../home/presentation/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/Login_Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<FocusNode> _nodes = [
    FocusNode(),
    FocusNode(),
  ];
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.07 ,right:size.width * 0.07  ,top: size.height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderLoginScreen(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                child: Text(
                  'Welcome again to our community, Please choose a login type.',
                  style: MyFontStyle.bookStyle(
                      16, AppColors.accentColor[150]!.withOpacity(0.8)),
                ),
              ),
              CustomTextInput(
                  iconUrl: 'assets/auth_icons/mail_icon.svg',
                  focusNode: _nodes[0],
                  controller: _emailController,
                  labelText: 'Email'),
              CustomTextInput(
                  iconUrl: 'assets/auth_icons/password_icon.svg',
                  focusNode: _nodes[1],
                  controller: _passwordController,
                  labelText: 'Password'),
              Padding(
                padding:  EdgeInsets.only(top:size.height*0.01),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style:
                        MyFontStyle.lightStyle(14, Colors.black.withOpacity(0.65)),
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.2,
              ),
              AuthButton(text: 'Login',onTapFunction:onTapFunction ,),
              // const LoginSection(),
              const SizedBox(height: 100,),
              const AlreadyHaveAccount(text: 'Register'),
            ],
          ),
        ),
      )),
    );
  }
  onTapFunction() async {
    if (_emailController.text.isEmpty) {
      makeToast('email must not be empty');
      return;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text) ||
        _passwordController.text.length < 8) {
      makeToast('E-Mail or Password is invalid');
      return;
    }
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      makeToast('Please check your internet connection');
      return;
    }
    final url = Uri.parse(ServerConfiguration.serverUrl +
        AuthConfiguration.loginEndPoint);
    final body = convert.jsonEncode(
        {"email":_emailController.text,"password": _passwordController.text});
    Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoadingPage()));
    await Helpers.postRequest(url, body);
    final authResponse = convert.jsonDecode(Helpers.currentResponse.body);
    if (authResponse['success']) {
      Navigator.popUntil(
        context,
        ModalRoute.withName('/'),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      makeToast('Login Successful');
    }
    else{
      Navigator.pop(context);
      makeToast('Login Failed');
    }
  }
}
