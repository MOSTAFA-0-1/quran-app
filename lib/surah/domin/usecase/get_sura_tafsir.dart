import 'package:dartz/dartz.dart';
import 'package:quran/surah/domin/repository/based_surah_repositry.dart';

import '../../../core/errors/failure.dart';

class GetSurahTafsir {
  final BasedSurahRepository basedSurahRepository;
  GetSurahTafsir({required this.basedSurahRepository});
  Future<Either<Failure, List<String>>> excute({ required int tafsirId,required int suraNumber,required int ayaNumber}) {
    return basedSurahRepository.getSurahTafsir(tafsirId,suraNumber,ayaNumber);
  }
}
