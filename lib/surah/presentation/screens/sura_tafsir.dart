import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custom_enum.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/surah/presentation/controller/Tafsir%20Cubit/tafsir_states.dart';
import 'package:quran/surah/presentation/wedgits/aya_tafsir.dart';

import '../controller/Tafsir Cubit/tafsir_cubit.dart';

class SuraTafsir extends StatelessWidget {
  const SuraTafsir({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    TafsirCubit.get(context).getTafsir(
        suraNumber: TafsirCubit.surah.number,
        ayaNumber: TafsirCubit.surah.ayasNumber);

    return Scaffold(
      body: BlocBuilder<TafsirCubit, TafsirCubitStates>(
        builder: (context, state) {
          if (state.dataStates == DataStates.loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TafsirCubit.surah.name),
                Expanded(
                  child: ListView.builder(
                    itemCount: TafsirCubit.surah.ayasNumber,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenSize.width * .05, vertical: 5),
                        child: AyaTafsir(
                            aya: TafsirCubit.surah.surahAyahs[index].text,
                            tafsir: state.tafsirTextList[index]),
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircleAvatar());
          }
        },
      ),
    );
  }
}
