import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custom_enum.dart';
import 'package:quran/core/service.dart';
import 'package:quran/surah/data/model/tafsir_model.dart';
import 'package:quran/surah/domin/intits/surah.dart';
import 'package:quran/surah/presentation/controller/Tafsir%20Cubit/tafsir_states.dart';

import '../../../../core/errors/failure.dart';
import '../../../domin/usecase/get_sura_tafsir.dart';

class TafsirCubit extends Cubit<TafsirCubitStates> {
  TafsirCubit() : super(TafsirCubitStates());
  static late Surah surah;
  static Tafsir? tafsir;
  void setSuraTafsir(Surah sura) {
    surah = sura;
  }

  static TafsirCubit get(BuildContext context) {
    return BlocProvider.of<TafsirCubit>(context);
  }

 void initState(){
  emit(state.copyWith(dataStates: DataStates.loading));
 }

  Either<Failure, List<String>>? result;
  getTafsir({
    required int suraNumber,
    required int ayaNumber,
  }) async {
    result = await sl<GetSurahTafsir>().excute(
        tafsirId: tafsir!.id, suraNumber: suraNumber, ayaNumber: ayaNumber);
    result!.fold(
        (l) => emit(
            state.copyWith(tafsirTextList: [], dataStates: DataStates.error)),
        (r) => emit(
            state.copyWith(tafsirTextList: r, dataStates: DataStates.loaded)));
  }
}
