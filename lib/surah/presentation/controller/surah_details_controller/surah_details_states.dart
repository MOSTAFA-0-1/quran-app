
import 'package:equatable/equatable.dart';
import 'package:quran/core/custom_enum.dart';

// ignore: must_be_immutable
class SurahDetailsStates extends Equatable {
  DataStates states;
  
  SurahDetailsStates({this.states = DataStates.loading});

  @override
  List<Object?> get props => throw UnimplementedError();
  
}

abstract class state {}
 class initial extends state{}
 class setdata extends state{}
 class getdata extends state{}
