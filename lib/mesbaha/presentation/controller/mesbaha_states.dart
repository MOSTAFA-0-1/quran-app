import 'package:equatable/equatable.dart';
import 'package:quran/mesbaha/domin/inteties/zeker.dart';

// ignore: must_be_immutable
class MesbahaStates extends Equatable {
  List<Zeker> azkar;
  String errorMassage;
  MState mState;
  MesbahaStates({this.azkar = const [], this.errorMassage = "",this.mState = MState.initial});

  MesbahaStates copyWith({List<Zeker>? azkar, String? errorMassage,MState? mState}) {
    return MesbahaStates(
        azkar: azkar ?? this.azkar,
        errorMassage: errorMassage ?? this.errorMassage,
        mState: mState ?? this.mState);
  }

  @override
  List<Object?> get props => [azkar,errorMassage,mState];
}

enum MState{
  initial,
  updated,
}