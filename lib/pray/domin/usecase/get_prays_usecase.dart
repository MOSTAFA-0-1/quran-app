import 'package:dartz/dartz.dart';
import 'package:quran/pray/domin/repository/base_pray_repository.dart';

import '../../../core/errors/failure.dart';
import '../intits/pray.dart';

class GetPrays {
  BasedPrayRepository basedPrayRepository;
  GetPrays({required this.basedPrayRepository});
   Future<Either<Failure,List<Pray>>> excute({required String date,required String country,required String city}){
    return basedPrayRepository.getPrays(date,country,city);
   }
}