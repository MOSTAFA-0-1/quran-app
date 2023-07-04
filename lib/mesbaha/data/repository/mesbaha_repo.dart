import 'package:quran/mesbaha/data/resources/mesbaha_local_data_source.dart';
import 'package:quran/mesbaha/domin/inteties/zeker.dart';
import 'package:quran/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quran/mesbaha/domin/repository/based_mesbaha_repo.dart';

class MesbahaRepository extends BasedMesbahaRepository {
  
  BasedMesbahaLocalDataSource mesbahaLocalDataSource;
  MesbahaRepository({required this.mesbahaLocalDataSource});

  @override
  List<Zeker> getAzkar() {
   return mesbahaLocalDataSource.getAzkar();
  }

  @override
  setzeker(String text, int index) {
   mesbahaLocalDataSource.setzeker(text, index);
  }
  
}