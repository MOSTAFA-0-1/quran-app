import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran/core/constant.dart';
import 'package:quran/core/errors/error_masage_model.dart';
import 'package:quran/core/exceptions/server_exception.dart';

import '../../../core/errors/failure.dart';
import '../../domin/intits/pray.dart';

abstract class BasedPrayRemoteDataSource {
  Future<Either<Failure, List<Pray>>> getPrays(
      String date, String country, String city);
}

List<Pray> prays = [];
int testHour = 0;

class PrayRemoteDataSource extends BasedPrayRemoteDataSource {
  @override
  Future<Either<Failure, List<Pray>>> getPrays(
      String date, String country, String city) async {
    final response = await Dio()
        .getUri(Uri.parse(constant.basedPrayUrl(date, country, city)));
    if (response.statusCode == 200) {
      (response.data["data"]["timings"] as Map).forEach((key, value) {
        if (key == "Sunset" ||
            key == "Imsak" ||
            key == "Midnight" ||
            key == "Firstthird" ||
            key == "Lastthird") {
        } else {
          testHour = int.parse((value as String).substring(0, 2));
          if (testHour >12) {
            if ((testHour - 12) < 10) {
              value = value.replaceRange(0, 2, "0${testHour - 12}");
            } else {
              value = value.replaceRange(0, 2, "${testHour - 12}");
            }
            value += " PM";
          }else if(testHour == 12){
            value+= " PM";
          }
           else {
            value += " AM";
          }
          prays.add(Pray(time: value));
        }
      });

      return Right(prays);
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}
