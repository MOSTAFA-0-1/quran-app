import 'package:dartz/dartz.dart';
import 'package:quran/mesbaha/domin/inteties/zeker.dart';
import 'package:quran/mesbaha/domin/repository/based_mesbaha_repo.dart';

import '../../../core/errors/failure.dart';

class GetAzkar {
  BasedMesbahaRepository basedMesbahaRepository;

  GetAzkar({required this.basedMesbahaRepository});
  Either<Failure, List<Zeker>> excute() {
    return basedMesbahaRepository.getAzkar();
  }

  void setZeker(String text, int index) {
    basedMesbahaRepository.setzeker(text, index);
  }
}
