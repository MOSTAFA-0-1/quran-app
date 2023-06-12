import 'package:dartz/dartz.dart';
import 'package:quran/core/exceptions/server_exception.dart';
import 'package:quran/surah/data/resources/surah_remote_data_resource.dart';
import 'package:quran/surah/domin/intits/surah.dart';
import 'package:quran/surah/domin/repository/based_surah_repositry.dart';

import '../../../core/errors/failure.dart';

class SurahRepository implements BasedSurahRepository {
  BasedSurahRemoteDataSource basedSurahRemoteDataSource;
  SurahRepository(this.basedSurahRemoteDataSource);

  @override
  Future<Either<Failure, List<Surah>>> getSurahs() async {
    final result = await basedSurahRemoteDataSource.getSurahs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.massage));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSurahTafsir(int tafsirId,int suraNumber,int ayaNumber) async {
    final result = await basedSurahRemoteDataSource.getSuraTafsir(tafsirId,suraNumber,ayaNumber);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.massage));
    }
  }
}
