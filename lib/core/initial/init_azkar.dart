
import 'package:quran/core/constant.dart';
import 'package:quran/core/shared%20pref/custom_shared_pref.dart';

class InitialZeker {
  static void init()async{
    
    SharedPref.pref!.setString("${constant.zeker}1", "سبحان الله");
    SharedPref.pref!.setInt(constant.zekerCounter(1), SharedPref.pref!.getInt(constant.zekerCounter(1))??0);
    
    SharedPref.pref!.setString("${constant.zeker}2", "الحمد لله");
    SharedPref.pref!.setInt(constant.zekerCounter(2), SharedPref.pref!.getInt(constant.zekerCounter(2))??0);

    SharedPref.pref!.setString("${constant.zeker}3", "الله اكبر");
    SharedPref.pref!.setInt(constant.zekerCounter(3), SharedPref.pref!.getInt(constant.zekerCounter(3))??0);

    SharedPref.pref!.setString("${constant.zeker}4", "اسنغفر الله");
    SharedPref.pref!.setInt(constant.zekerCounter(4), SharedPref.pref!.getInt(constant.zekerCounter(4))??0);

    SharedPref.pref!.setInt("length", SharedPref.pref!.getInt("length")??4);

  }
}