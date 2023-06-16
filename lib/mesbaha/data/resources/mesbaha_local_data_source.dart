import 'package:dartz/dartz.dart';
import 'package:quran/core/constant.dart';
import 'package:quran/core/errors/error_masage_model.dart';
import 'package:quran/core/exceptions/server_exception.dart';
import 'package:quran/surah/presentation/controller/Aya%20Of%20The%20Day/aya_of_day_cubit.dart';
import '../../../core/errors/failure.dart';
import '../../../core/initial/init_azkar.dart';
import '../../domin/inteties/zeker.dart';

abstract class BasedMesbahaLocalDataSource {
  Either<Failure, List<Zeker>> getAzkar();
  void setzeker(String text, int index);
}

class MesbahaLocalDataSource extends BasedMesbahaLocalDataSource {
  List<Zeker> azkar = [];

  @override
  Either<Failure, List<Zeker>> getAzkar() {
    azkar = [];
    InitialZeker.init();
    for (int i = 1; i < 5; i++) {
      if (AyaOfDayCubit.pref!.getString("${constant.zeker}$i") != null) {
        azkar.add(
          Zeker(
              id: constant.zekerCounter(i),
              zekerText: AyaOfDayCubit.pref!.getString("${constant.zeker}$i")!,
              counter: AyaOfDayCubit.pref!.getInt(constant.zekerCounter(i))!),
        );
      }
    }
    if (azkar.isEmpty) {
      throw DatabaseException(
          errorMassageModel: ErrorMassageModel.fromJson(
              {"massage": "not found", "status": "error", "code": 0}));
    } else {
      return Right(azkar);
    }
  }

  @override
  void setzeker(String text, int index) {
    AyaOfDayCubit.pref!.setString("${constant.zeker}$index", text);
    AyaOfDayCubit.pref!.setInt(constant.zekerCounter(index), index);
  }
}
