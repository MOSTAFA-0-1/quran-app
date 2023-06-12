import 'package:dio/dio.dart';
import 'package:quran/core/constant.dart';
import 'package:quran/core/errors/error_masage_model.dart';
import 'package:quran/core/exceptions/server_exception.dart';
import 'package:quran/surah/data/model/surah_model.dart';
import 'package:al_quran/al_quran.dart';

abstract class BasedSurahRemoteDataSource {
  Future<List<SurahModel>> getSurahs();
  Future<List<String>> getSuraTafsir(int tafsirId,int suraNumber,int ayaNumber);
}

class SurahRemoteDatasource implements BasedSurahRemoteDataSource {
  @override
  Future<List<SurahModel>> getSurahs() async {
    Response response = await Dio().get(constant.basedApiUrl);
    Response ayatResponse = await Dio().get(constant.basedApiUrlAyat);
    if (response.statusCode == 200) {
      return List<SurahModel>.from((response.data["data"] as List).map(
          (surah) => SurahModel.fromJson(
              surah,
              ayatResponse.data["data"]["surahs"][surah["nomor"] - 1]
                  ["ayahs"])));
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  late Response response;
  @override
  Future<List<String>> getSuraTafsir(int tafsirId,int suraNumber,int ayaNumber) async {
    final dio = Dio();
    dio.options.connectTimeout = 4000;
    response = await dio.get(constant.basedTafsirUrl(tafsirId, suraNumber, ayaNumber));

    if (response.statusCode == 200) {
      return List<String>.from((response.data as List).map((e) => e["text"]));
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}
