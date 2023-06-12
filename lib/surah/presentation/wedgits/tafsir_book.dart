import 'package:flutter/material.dart';
import 'package:quran/core/transtion/animated_navigation.dart';
import 'package:quran/surah/data/model/tafsir_model.dart';
import 'package:quran/surah/presentation/controller/Tafsir%20Cubit/tafsir_cubit.dart';
import 'package:quran/surah/presentation/screens/suras_tafsir.dart';

class TafsirBook extends StatelessWidget {
  TafsirBook({Key? key, required this.tafsir}) : super(key: key);
  Tafsir tafsir;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TafsirCubit.tafsir = tafsir;
        animatedPush(context, const SurasTafsir());
      },
      child: SizedBox(
        width: 70,
        height: 100,
        child: Center(
          child: Image.asset(
            tafsir.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
