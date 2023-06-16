
import 'package:quran/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialZeker {
  static void init()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("${constant.zeker}1", "سبحان الله");
    pref.setInt(constant.zekerCounter(1), pref.getInt(constant.zekerCounter(1))??0);
    
    pref.setString("${constant.zeker}2", "الحمد لله");
    pref.setInt(constant.zekerCounter(2), pref.getInt(constant.zekerCounter(2))??0);

    pref.setString("${constant.zeker}3", "الله اكبر");
    pref.setInt(constant.zekerCounter(3), pref.getInt(constant.zekerCounter(3))??0);

    pref.setString("${constant.zeker}4", "اسنغفر الله");
    pref.setInt(constant.zekerCounter(4), pref.getInt(constant.zekerCounter(4))??0);

    pref.setInt("length", pref.getInt("length")??4);

  }
}