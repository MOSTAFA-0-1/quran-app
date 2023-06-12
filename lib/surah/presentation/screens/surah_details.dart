import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran/core/custom_variables.dart';
import 'package:quran/surah/presentation/wedgits/details_buttons.dart';
// ignore: must_be_immutable
class SurahDetailsUi extends StatelessWidget {
  SurahDetailsUi({Key? key}) : super(key: key);
  AudioPlayer player = AudioPlayer();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    i = 0;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                      child: Text(
                    customVar.getSurahDetailsCubit(context).surah!.name,
                    style: Theme.of(context).textTheme.headline6,
                  )),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 30),
                        child: SingleChildScrollView(
                          child: Text.rich(TextSpan(
                              children: customVar
                                  .getSurahDetailsCubit(context)
                                  .surah!
                                  .surahAyahs
                                  .map((aya) => TextSpan(
                                      text: "${aya.text}  ${++i} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6))
                                  .toList())),
                        ))),
                PlayButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
