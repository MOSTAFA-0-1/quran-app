import 'package:dartz/dartz.dart';
import 'package:quran/surah/domin/repository/based_surah_repositry.dart';

import '../../../core/errors/failure.dart';
import '../intits/surah.dart';

class GetSurahs {
  final BasedSurahRepository basedSurahRepository;
  GetSurahs({required this.basedSurahRepository});
 Future<Either<Failure, List<Surah>>> excute(){
    return basedSurahRepository.getSurahs();
  }
}
