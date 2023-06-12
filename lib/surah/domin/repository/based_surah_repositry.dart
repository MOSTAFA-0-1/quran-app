import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure.dart';
import 'package:quran/surah/domin/intits/surah.dart';

abstract class BasedSurahRepository {
  Future<Either<Failure, List<Surah>>> getSurahs();

  Future<Either<Failure, List<String>>> getSurahTafsir(int tafsirId,int suraNumber,int ayaNumber);
}
