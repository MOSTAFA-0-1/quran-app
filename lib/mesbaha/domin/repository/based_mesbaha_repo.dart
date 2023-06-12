import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure.dart';
import 'package:quran/mesbaha/domin/inteties/zeker.dart';

abstract class BasedMesbahaRepository {
  Either<Failure,List<Zeker>> getAzkar();
  void setzeker(String text,int index);

}