
import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal{

  static final SPGlobal _instance = SPGlobal._();
  SPGlobal._();

  factory SPGlobal(){
    return _instance;
  }

  late SharedPreferences prefs;

  initSharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
  }

  bool get isLogin {
    return prefs.getBool('isLogin') ?? false;
  }

  set isLogin(bool value){
    prefs.setBool('isLogin', value);
  }

  String get token{
    return prefs.getString('token') ?? "";
  }

  set token(String value){
    prefs.setString('token', value);
  }




}

