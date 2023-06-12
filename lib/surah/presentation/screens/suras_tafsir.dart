import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custom_variables.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/surah/presentation/controller/Tafsir%20Cubit/tafsir_cubit.dart';
import 'package:quran/surah/presentation/screens/sura_tafsir.dart';
import '../../../core/custom_enum.dart';
import '../../../core/transtion/animated_navigation.dart';
import '../controller/surah_controller/surah_cubit.dart';
import '../controller/surah_controller/surah_states.dart';
import '../wedgits/surah_ui.dart';

class SurasTafsir extends StatelessWidget {
  const SurasTafsir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          " تفسير ${TafsirCubit.tafsir!.name}",
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: ScreenSize.height * .85,
          child: BlocBuilder<SurahCubit, SurahState>(
            builder: (context, state) {
              customVar.getCubit(context).getSurah(context);
              // print(state.surahs.hashCode);
              if (state.states == DataStates.loaded) {
                return Column(
                  children: [
                    // Text(""),
                    Expanded(
                      child: ListView(
                        children: state.surahs.map((surah) {
                          return InkWell(
                            onTap: () {
                              TafsirCubit.get(context).setSuraTafsir(surah);
                              TafsirCubit.get(context).initState();

                              animatedPush(context, const SuraTafsir());
                            },
                            child: SurahUi(
                              surahName: surah.name,
                              englishName: surah.englishName,
                              ayahsNumber: surah.ayasNumber,
                              revelationType: surah.revelationType,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    ));
  }
}
