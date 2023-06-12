import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/surah/presentation/controller/surah_details_controller/ayah_cubit.dart';

class ayatest extends StatelessWidget {
  ayatest({Key? key, required this.surahUrl}) : super(key: key);
  String surahUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AyaCubit, AyaState>(
        builder: (context, state) {
          switch (state.ayaStates) {
            case AyaEnum.finished:
              BlocProvider.of<AyaCubit>(context).play(surahUrl);
              break;
            default:
          }

          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                     
                        BlocProvider.of<AyaCubit>(context).play(surahUrl);
                      
                    },
                    icon: const Icon(Icons.play_arrow)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AyaCubit>(context).pause();
                    },
                    icon: const Icon(Icons.stop)),
                    IconButton(
                    onPressed: () {
                      BlocProvider.of<AyaCubit>(context).resume();
                    },
                    icon: const Icon(Icons.pause))
              ],
            ),
          );
        },
      ),
    );
  }
}
