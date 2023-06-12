import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custom_enum.dart';
import 'package:quran/core/custom_variables.dart';
import 'package:quran/core/transtion/animated_navigation.dart';
import 'package:quran/surah/presentation/screens/surah_details.dart';
import 'package:quran/surah/presentation/wedgits/surah_ui.dart';
import '../controller/surah_controller/surah_cubit.dart';
import '../controller/surah_controller/surah_states.dart';


class SurahsUi extends StatelessWidget {
  SurahsUi({Key? key, required this.readerId}) : super(key: key);

  int readerId;
  @override
  Widget build(BuildContext context) {
    //   print("object");
    //  return Scaffold();
    return Scaffold(
      body: BlocBuilder<SurahCubit, SurahState>(
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
                        // customVar.getSurahDetailsCubit(context).getStart(surah.surahAyahs);
                        customVar
                            .getSurahDetailsCubit(context)
                            .setSurah(surah, readerId);
                        animatedPush(context, SurahDetailsUi());
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
    ));
  }

  void getData() async {}
}
