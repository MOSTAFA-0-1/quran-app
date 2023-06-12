import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/surah/presentation/controller/surah_details_controller/surah_details_cubit.dart';
import '../surah/presentation/controller/surah_controller/surah_cubit.dart';
import 'custon controller/rebuild_cubit.dart';

// ignore: camel_case_types
class customVar {
  static SurahCubit getCubit(BuildContext context) {
    return BlocProvider.of<SurahCubit>(context);
  }

  static SurahCubit getListnerCubit(BuildContext context) {
    return BlocProvider.of<SurahCubit>(context, listen: true);
  }

  static SurahDetailsCubit getSurahDetailsCubit(BuildContext context) {
    return BlocProvider.of<SurahDetailsCubit>(context);
  }

  static SurahDetailsCubit getListnerSurahDetailsCubit(BuildContext context) {
    return BlocProvider.of<SurahDetailsCubit>(context, listen: true);
  }
   static RebuildCubit getRebuildCubit(BuildContext context) {
    return BlocProvider.of<RebuildCubit>(context);
  }
}
