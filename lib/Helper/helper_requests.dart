
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Helpers{
  static var currentResponse;
  static postRequest(url,body)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();



    if(prefs.getString('access_token')!=null) {
      currentResponse = await http.post(url, body: body,
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer ${prefs.getString('access_token')}"
          });
    }
    else {
      currentResponse = await http.post(url, body: body,
          headers: {
            "Content-type": "application/json",
          });
    }
  }
  static getRequest(url)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('access_token') != null) {
      currentResponse = await http.get(url, headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer ${prefs.getString('access_token')}"
      });
    }
    else {
      currentResponse = await http.get(url);
    }
  }
}