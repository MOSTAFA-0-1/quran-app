import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/surah/presentation/controller/Aya%20Of%20The%20Day/aya_of_day_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../surah_controller/surah_cubit.dart';

class AyaOfDayCubit extends Cubit<AyaOfDayStates> {
  AyaOfDayCubit() : super(Init());
  String ayascounterKey = "Ayascounter";
  String surahscounterKey = "SurahCounter";

  static SharedPreferences? pref;
  static void initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static AyaOfDayCubit get(BuildContext context) {
    return BlocProvider.of<AyaOfDayCubit>(context);
  }

  void rebuild() {
    emit(Rebuild());
  }

  String getSurah(BuildContext context) {
    return SurahCubit.get(context).state.surahs.isNotEmpty
        ? SurahCubit.get(context).state.surahs[getSurahscounter()].name
        : "";
  }

  String getAya(BuildContext context) {
    
    return SurahCubit.get(context).state.surahs.isNotEmpty
        ? SurahCubit.get(context)
            .state
            .surahs[getSurahscounter()]
            .surahAyahs[getAyascounter()]
            .text
        : "";
  }

  void increase(BuildContext context) {
    if (pref!.getInt(ayascounterKey) == null &&
        pref!.getInt(surahscounterKey) == null) {
      pref!.setInt(ayascounterKey, 0);
      pref!.setInt(surahscounterKey, 0);
    }

    pref!.setInt(ayascounterKey, getAyascounter() + 1);

    if (getAyascounter() >=
        SurahCubit.get(context).state.surahs[getSurahscounter()].ayasNumber) {
      pref!.setInt(surahscounterKey, getSurahscounter() + 1);
      pref!.setInt(ayascounterKey, 0);
    }
    emit(Rebuild());
  }

  void decrease(BuildContext context) {
    if (!(getAyascounter() == 0 && getSurahscounter() == 0)) {
      if (getAyascounter() == 0) {
        pref!.setInt(surahscounterKey, getSurahscounter() - 1);
        pref!.setInt(
            ayascounterKey,
            SurahCubit.get(context)
                    .state
                    .surahs[getSurahscounter()]
                    .ayasNumber -
                1);
      } else {
        pref!.setInt(ayascounterKey, pref!.getInt(ayascounterKey)! - 1);
      }
      emit(Rebuild());
    }
  }

  int getAyascounter() {
    return pref!.getInt(ayascounterKey) ?? 0;
  }

  int getSurahscounter() {
    return pref!.getInt(surahscounterKey) ?? 0;
  }
}
