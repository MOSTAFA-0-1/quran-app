import 'package:quran/surah/presentation/controller/slider_cubit/slider_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<SliderStates> {
  SliderCubit() : super(SliderStates());
  getduration(double duration){
    state.duration = duration;
  }
  getPosition(double position,){
   emit(state.copyWith(
    position: position,
    states: SliderStatesEnum.playing
   ));
  }
  getSliderData(double position,double duration){
   emit(state.copyWith(
    position: position,
    duration: duration,
    states: SliderStatesEnum.playing
   ));
  }
 
  
}