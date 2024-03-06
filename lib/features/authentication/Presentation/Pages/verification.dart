import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'dart:convert' as convert;
import '../../../../Helper/app_color.dart';
import '../../../../Helper/font_style.dart';
import '../../../../Helper/helper_requests.dart';
import '../../../../end_points_configuration/auth/auth_config.dart';
import '../../../../end_points_configuration/server/server_config.dart';
import '../../../../toast.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../Widgets/verfification_number_feild.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({required this.email, Key? key}) : super(key: key);
  final String email;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<bool> completedVerificationNotifier;
  late ValueNotifier<bool> _enabledResendNotifier;
  int secondsDuration = 15;
  late CountdownTimerController controller;
  late int endTime;

  void onEnd() {
    controller.disposeTimer();

    if (secondsDuration < 60) {
      secondsDuration += 15;
    }
    _enabledResendNotifier.value = true;
  }

  @override
  void initState() {
    completedVerificationNotifier = ValueNotifier<bool>(false);
    _enabledResendNotifier = ValueNotifier<bool>(false);

    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * secondsDuration;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            colors: [
              AppColors.primaryColor[50]!,
              AppColors.primaryColor[50]!.withOpacity(0.7),
              AppColors.primaryColor[50]!.withOpacity(0.4),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 0.3, 1.0],
            tileMode: TileMode.clamp,
          ))),
          Container(
            width: size.width * 0.95,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Code resend to email: ',
                      style: MyFontStyle.boldStyle(
                          16, AppColors.accentColor[50]!)),
                  TextSpan(
                      text: widget.email,
                      style: MyFontStyle.boldStyle(
                          16, AppColors.primaryColor[50]!)),
                ])),
                const SizedBox(
                  height: 30,
                ),
                VerificationNumberFields(
                  onCompleted: (verificationCode) => _onVerification('1234'),
                  onChanged: (code) {
                    completedVerificationNotifier.value = code.length == 4;
                  },

                ),
                const SizedBox(
                  height: 30,
                ),
                ValueListenableBuilder<bool>(
                    valueListenable: _enabledResendNotifier,
                    builder: (context, enabledResend, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'did not receive code? ',
                                    style: MyFontStyle.boldStyle(
                                        14, Colors.grey.shade300)),
                                TextSpan(
                                  text: 'resend',
                                  style: MyFontStyle.boldStyle(
                                      14,
                                      AppColors.primaryColor[50]!.withOpacity(
                                          enabledResend ? 1.0 : 0.5)),
                                  recognizer: enabledResend
                                      ? (TapGestureRecognizer()
                                        ..onTap = _onResend)
                                      : null,
                                ),
                              ],
                            ),
                          ),
                          if (!enabledResend) ...{
                            const SizedBox(width: 20,),
                            CountdownTimer(
                              widgetBuilder: (_, remainingTime) {
                                return Text('00 : ${remainingTime?.sec}',
                                    style: MyFontStyle.bookStyle(
                                        12, AppColors.primaryColor[50]!));
                              },
                              controller: controller,
                              onEnd: onEnd,
                              endTime: endTime,
                              endWidget: const SizedBox(),
                            ),
                          }
                        ],
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onResend() {
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * secondsDuration;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    controller.start();
    _enabledResendNotifier.value = false;
  }
  _onVerification(String code)async {
    FocusScope.of(context).unfocus();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      makeToast('Please check your internet connection');
      return;
    }
    final url = Uri.parse(ServerConfiguration.serverUrl +
        AuthConfiguration.createAccountEndPoint);
    final body = convert.jsonEncode({
    'verification_token':code
    });
    await Helpers.postRequest(url, body);
    if(Helpers.currentResponse['success']){
      if(Helpers.currentResponse['data']){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) =>  const HomeScreen()),
              (route) => false,
        );
        makeToast('SignUp Successful');
      }
      else{
        makeToast('Wrong verification code');
      }
    }
    else {
      makeToast('Something went wrong');
    }
  }
}
