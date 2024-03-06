import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/Helper/helper_requests.dart';
import 'package:graduation_project/end_points_configuration/auth/auth_config.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/already_have_account.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/auth_button.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/custom_text_input.dart';
import 'package:graduation_project/features/authentication/Presentation/Widgets/fetch_image.dart';
import 'package:graduation_project/features/home/presentation/pages/home_screen.dart';
import 'package:graduation_project/loading_page.dart';
import 'package:graduation_project/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import '../../../../end_points_configuration/server/server_config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/sign_up_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _passwordController;

  late TextEditingController _confirmPasswordController;

  late TextEditingController _emailController;
  late TextEditingController _fullNameController;
  final List<FocusNode> _nodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Account',
                      style: MyFontStyle.boldStyle(
                          30, AppColors.primaryColor[25]!),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Text(
                        'Welcome to our community .in order to sign up, please fill out all fields below.',
                        style: MyFontStyle.bookStyle(
                            18, AppColors.accentColor[150]!),
                      ),
                    ),
                    const FetchImage(),
                    CustomTextInput(
                        iconUrl: 'assets/auth_icons/name_icon.svg',
                        focusNode: _nodes[0],
                        controller: _fullNameController,
                        labelText: 'Full Name'),
                    CustomTextInput(
                        iconUrl: 'assets/auth_icons/mail_icon.svg',
                        focusNode: _nodes[1],
                        controller: _emailController,
                        labelText: 'Email'),
                    CustomTextInput(
                        iconUrl: 'assets/auth_icons/password_icon.svg',
                        focusNode: _nodes[2],
                        controller: _passwordController,
                        labelText: 'Password'),
                    CustomTextInput(
                        iconUrl: 'assets/auth_icons/password_icon.svg',
                        focusNode: _nodes[3],
                        controller: _confirmPasswordController,
                        labelText: 'Confirm Password'),
                    AuthButton(
                      text: 'Create Account',
                      onTapFunction: onTapFunction,
                    ),
                    // const LoginSection(),
                    const SizedBox(height: 30,),
                    const AlreadyHaveAccount(
                      text: 'Login',
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
  onTapFunction() async {
    if (_emailController.text.isEmpty) {
      makeToast('E-Mail must not be empty');
      return;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text) ||
        _passwordController.text.length < 8) {
      makeToast('E-Mail or Password is invalid');
      return;
    } else if (_confirmPasswordController.text != _passwordController.text) {
      makeToast('Passwords does not Matched');
      return;
    }
    else if(_fullNameController.text.isEmpty){
      makeToast('Name must not be empty');
      return;
    }
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      makeToast('Please check your internet connection');
      return;
    }
    final url = Uri.parse(ServerConfiguration.serverUrl +
        AuthConfiguration.createAccountEndPoint);
    final body = convert.jsonEncode(
        {"email": _emailController.text,"name":_fullNameController.text, "password": _passwordController.text});
    Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoadingPage()));
    await Helpers.postRequest(url, body);
    final authResponse = convert.jsonDecode(Helpers.currentResponse.body);
    if (authResponse['success']) {
      SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setString('access_token', authResponse['data']['access_token']);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
        );
      makeToast('SignUp Successful');
    }
    else{
      Navigator.pop(context);
      makeToast('SignUp Failed');
    }
  }
}
