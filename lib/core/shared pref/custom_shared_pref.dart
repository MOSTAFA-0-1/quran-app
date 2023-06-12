import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
 static  SharedPreferences? pref;
 static Future<void> initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }
 static test(){
  pref!.setInt("key", 9);
  if (pref!.getInt("key") == 6) {
      print(pref!.getInt("key"));
  }else{
      print("hello");
  }
 }
}
