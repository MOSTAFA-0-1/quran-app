import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custom_enum.dart';
import 'package:quran/core/service.dart';
import 'package:quran/surah/domin/usecase/get_suras.dart';
import 'package:quran/surah/presentation/controller/Aya%20Of%20The%20Day/aya_of_day_cubit.dart';
import 'surah_states.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahState());
  static SurahCubit get(BuildContext context) {
    return BlocProvider.of<SurahCubit>(context);
  }

  Future<void> getSurah(BuildContext context) async {
    if (state.surahs.isEmpty) {
      final result = await sl<GetSurahs>().excute();

      result.fold(
          (l) => emit(state.copyWith(
              states: DataStates.error, errorMassage: l.massage)),
          (r) {
            emit(state.copyWith(surahs: r, states: DataStates.loaded));
            AyaOfDayCubit.get(context).rebuild();
          } );
    }
  }

  bool isAndroid() {
    return Platform.isAndroid;
  }
}
