import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure.dart';
import 'package:quran/pray/domin/intits/pray.dart';

abstract class BasedPrayRepository {
  Future<Either<Failure,List<Pray>>> getPrays(String date,String country,String city);
}