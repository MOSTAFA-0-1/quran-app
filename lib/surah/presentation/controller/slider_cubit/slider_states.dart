import 'package:equatable/equatable.dart';

class SliderStates extends Equatable {
  double position,duration;
  SliderStatesEnum states;

  @override
  List<Object?> get props => [position,states,duration];

  SliderStates({this.position = 0,this.duration = 0, this.states = SliderStatesEnum.init});
  SliderStates copyWith({double? position,double? duration, SliderStatesEnum? states}) {
    return SliderStates(
        position: position ?? this.position,duration: duration ?? this.duration, states: states ?? this.states);
  }
}

enum SliderStatesEnum { init, playing }
