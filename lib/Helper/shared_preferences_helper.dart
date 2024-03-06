
import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper{

  static makeOnBoardingViewed()async
  {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool('on boarding viewed', true);
  }

}