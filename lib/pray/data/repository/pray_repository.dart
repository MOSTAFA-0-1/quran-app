

import 'package:quran/pray/data/resources/remote_data_source.dart';
import 'package:quran/pray/domin/intits/pray.dart';
import 'package:quran/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quran/pray/domin/repository/base_pray_repository.dart';

class PrayRepository extends BasedPrayRepository{
  BasedPrayRemoteDataSource basedPrayRemoteDataSource;
  PrayRepository({required this.basedPrayRemoteDataSource});
  @override
  Future<Either<Failure, List<Pray>>> getPrays(String date,String country,String city) {
    return basedPrayRemoteDataSource.getPrays(date,country,city);
  }
  
}