import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';

class AyaCubit extends Cubit<AyaState> {
  AyaCubit() : super(AyaState());
  AudioPlayer player = AudioPlayer();

  play(String url){
    player.play(UrlSource(url));
  }
  pause(){
    player.pause();
   
  }
   resume(){
    player.resume();
   }
}

class AyaState {
  AyaEnum ayaStates;
  AyaState({this.ayaStates = AyaEnum.initial});
  AyaState copyWith({
    AyaEnum? ayaStates
  }){
   return AyaState(ayaStates: ayaStates ?? this.ayaStates);
  }
}

enum AyaEnum { pause, stopped, finished ,initial}
