import 'package:equatable/equatable.dart';
import 'package:quran/core/custom_enum.dart';

// ignore: must_be_immutable
class TafsirCubitStates extends Equatable {
  List<String> tafsirTextList;
  DataStates dataStates;
  TafsirCubitStates({this.tafsirTextList = const [],this.dataStates = DataStates.loading});
  TafsirCubitStates copyWith({List<String>? tafsirTextList,DataStates? dataStates}) {
    return TafsirCubitStates(
        tafsirTextList: tafsirTextList ?? this.tafsirTextList,
        dataStates: dataStates ?? this.dataStates
        );
  }

  @override
  List<Object?> get props => [tafsirTextList,dataStates];
}
