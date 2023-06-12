import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custom_variables.dart';
import 'package:quran/core/custon%20controller/custom_state.dart';
import 'package:quran/core/custon%20controller/rebuild_cubit.dart';
import '../../../widgets/circular_button.dart';

class PlayButton extends StatelessWidget {
  PlayButton({Key? key}) : super(key: key);
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<RebuildCubit, CustomStates>(
          builder: (context, state) {
            return CircularButton(
                iconData: isPlaying ? Icons.stop : Icons.play_arrow,
                function: () {
                  if (isPlaying) {
                    customVar.getSurahDetailsCubit(context).pause();
                    isPlaying = !isPlaying;
                    RebuildCubit.get(context).rebuild();
                  } else {
                    customVar.getSurahDetailsCubit(context).play(context);
                    isPlaying = !isPlaying;
                    RebuildCubit.get(context).rebuild();
                  }
                });
          },
        ),
      ],
    );
  }
}
