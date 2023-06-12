import 'package:get_it/get_it.dart';
import 'package:quran/mesbaha/data/repository/mesbaha_repo.dart';
import 'package:quran/mesbaha/data/resources/mesbaha_local_data_source.dart';
import 'package:quran/mesbaha/domin/repository/based_mesbaha_repo.dart';
import 'package:quran/mesbaha/domin/usecase/mesbaha_usecase.dart';
import 'package:quran/pray/data/repository/pray_repository.dart';
import 'package:quran/pray/domin/usecase/get_prays_usecase.dart';
import 'package:quran/pray/presentation/controller/qibla%20cubit/qibla_cubit.dart';
import 'package:quran/surah/domin/intits/surah.dart';
import 'package:quran/surah/domin/usecase/get_sura_tafsir.dart';
import 'package:quran/surah/domin/usecase/get_suras.dart';
import 'package:quran/surah/presentation/controller/Aya%20Of%20The%20Day/aya_of_day_cubit.dart';
import 'package:quran/surah/presentation/controller/surah_details_controller/surah_details_cubit.dart';

import '../pray/data/resources/remote_data_source.dart';
import '../pray/domin/repository/base_pray_repository.dart';
import '../pray/presentation/controller/Pray Cubit/pray_cubit.dart';
import '../surah/data/repository/surah_repository.dart';
import '../surah/data/resources/surah_remote_data_resource.dart';
import '../surah/domin/repository/based_surah_repositry.dart';
import '../surah/presentation/controller/Tafsir Cubit/tafsir_cubit.dart';
import '../surah/presentation/controller/surah_controller/surah_cubit.dart';
import '../surah/presentation/controller/surah_details_controller/ayah_cubit.dart';
import 'custon controller/rebuild_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // cubits
    sl.registerFactory(() => SurahCubit());
    sl.registerFactory(() => AyaOfDayCubit());
    sl.registerFactory(() => QiblaCubit());
    sl.registerFactory(() => AyaCubit());
    sl.registerFactory(() => RebuildCubit());
    sl.registerFactory(() => TafsirCubit());
    sl.registerFactory(() => PrayCubit());
    sl.registerFactory<SurahDetailsCubit>(() => SurahDetailsCubit());

    // surah
    sl.registerLazySingleton<BasedSurahRemoteDataSource>(
        () => SurahRemoteDatasource());
    sl.registerLazySingleton<BasedSurahRepository>(() => SurahRepository(sl()));
    sl.registerLazySingleton(
        () => GetSurahs(basedSurahRepository: sl<BasedSurahRepository>()));
    sl.registerLazySingleton<GetSurahTafsir>(
        () => GetSurahTafsir(basedSurahRepository: sl<BasedSurahRepository>()));

    // Pray
    sl.registerLazySingleton<BasedPrayRemoteDataSource>(
        () => PrayRemoteDataSource());
    sl.registerLazySingleton<BasedPrayRepository>(
        () => PrayRepository(basedPrayRemoteDataSource: sl()));
    sl.registerLazySingleton(
        () => GetPrays(basedPrayRepository: sl<BasedPrayRepository>()));

        // Mesbaha
    sl.registerLazySingleton<BasedMesbahaLocalDataSource>(
        () => MesbahaLocalDataSource());
    sl.registerLazySingleton<BasedMesbahaRepository>(
        () => MesbahaRepository(mesbahaLocalDataSource: sl<BasedMesbahaLocalDataSource>()));
    sl.registerLazySingleton<GetAzkar>(
        () => GetAzkar(basedMesbahaRepository: sl<BasedMesbahaRepository>()));
  }
}
