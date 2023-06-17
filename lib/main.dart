import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custon%20controller/rebuild_cubit.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/core/shared%20pref/custom_shared_pref.dart';
import 'package:quran/core/themes/main_theme.dart';
import 'package:quran/pray/presentation/controller/Pray%20Cubit/pray_cubit.dart';
import 'package:quran/pray/presentation/controller/qibla%20cubit/qibla_cubit.dart';
import 'package:quran/readers/getReaders/get_readers.dart';
import 'package:quran/screens/splash.dart';
import 'package:quran/surah/presentation/controller/Aya%20Of%20The%20Day/aya_of_day_cubit.dart';
import 'package:quran/surah/presentation/controller/Tafsir%20Cubit/tafsir_cubit.dart';
import 'package:quran/surah/presentation/controller/slider_cubit/slider_cubit.dart';
import 'package:quran/surah/presentation/controller/surah_details_controller/ayah_cubit.dart';
import 'package:quran/surah/presentation/controller/surah_details_controller/surah_details_cubit.dart';
import 'package:quran/surah/presentation/screens/surah_details.dart';
import 'package:quran/surah/presentation/screens/surahs_ui.dart';
import 'core/service.dart';
import 'mesbaha/presentation/controller/mesbaha_cubit.dart';
import 'surah/presentation/controller/surah_controller/surah_cubit.dart';

void main() {
  ServicesLocator().init();
  GetReaders.addReaders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SurahCubit>(
            create: (context) => sl<SurahCubit>(),
          ),
          BlocProvider<SurahDetailsCubit>(
            create: (context) => sl<SurahDetailsCubit>(),
          ),
          BlocProvider<AyaCubit>(
            create: (context) => sl<AyaCubit>(),
          ),
          BlocProvider<SliderCubit>(
            create: (context) => sl<SliderCubit>(),
          ),
          BlocProvider<RebuildCubit>(
            create: (context) => sl<RebuildCubit>(),
          ),
          BlocProvider<TafsirCubit>(
            create: (context) => sl<TafsirCubit>(),
          ),
          BlocProvider<PrayCubit>(
            create: (context) => sl<PrayCubit>(),
          ),
          BlocProvider<AyaOfDayCubit>(
            create: (context) => sl<AyaOfDayCubit>(),
          ),
          BlocProvider<QiblaCubit>(
            create: (context) => sl<QiblaCubit>(),
          ),
          BlocProvider<MesbahaCubit>(
            create: (context) => MesbahaCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.themeData,
          home: Builder(
            builder: (context) {
              AyaOfDayCubit.initSharedPref();
              SurahCubit.get(context).getSurah(context);
              PrayCubit.get(context).getPrays();
              ScreenSize.getSize(MediaQuery.of(context).size);
              SharedPref.initSharedPref();
              return  Splash();
            },
          ),
          routes: {
            "surahsUi": (context) => SurahsUi(
                  readerId: 0,
                ),
            "details": (context) => SurahDetailsUi()
          },
        ));
  }
}
