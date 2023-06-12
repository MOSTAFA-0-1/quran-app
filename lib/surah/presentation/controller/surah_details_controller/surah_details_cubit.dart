import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/surah/domin/intits/ayah.dart';
import 'package:quran/surah/domin/intits/surah.dart';
import 'package:quran/surah/presentation/controller/slider_cubit/slider_cubit.dart';
import 'package:quran/surah/presentation/controller/surah_details_controller/surah_details_states.dart';

class SurahDetailsCubit extends Cubit<state> {
  SurahDetailsCubit() : super(initial());
  AudioPlayer player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  bool iscompleted = false;
  Surah? surah;
  Ayah? aya;
  int? readerId;

  void setSurah(Surah surah, int id) {
    this.surah = surah;
    readerId = id;
  }

  Surah getSurah() {
    return surah!;
  }

  AudioPlayer getPlayer() {
    return player;
  }

  Duration getPosition() {
    player.onPositionChanged.listen((newPosition) {
      position = newPosition;
    });
    return position;
  }
  // MediaInfo mediaInfo = MediaInfo();

  void play(BuildContext context) async {
    
    await player.play(UrlSource(surah!.audioUrls[readerId!]));
    player.onPlayerStateChanged.listen((event) {
      isPlaying = event == PlayerState.playing;
      print(isPlaying);
      // player.onPositionChanged.listen((newPosition) {
      //   BlocProvider.of<SliderCubit>(context)
      //       .getPosition(newPosition.inSeconds.toDouble());
      // });
      // player.onDurationChanged.listen((newDuration) {
      //   BlocProvider.of<SliderCubit>(context)
      //       .getduration(newDuration.inSeconds.toDouble());
      // });
    });
  }

  void pause() {
    player.pause();
  }

  void resume() {
    player.resume();
  }

  double getduration() {
    player.onDurationChanged.listen((newDuration) {
      duration = newDuration;
    });
    return duration.inSeconds.toDouble();
  }

  test() {}
  int i = 0;

  String getAyahText() {
    if (aya != null) {
      return aya!.text;
    }
    return "error";
  }
}
