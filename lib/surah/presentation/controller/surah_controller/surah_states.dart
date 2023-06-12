import 'package:equatable/equatable.dart';
import 'package:quran/core/custom_enum.dart';
import 'package:quran/surah/data/model/surah_model.dart';
import 'package:quran/surah/domin/intits/surah.dart';

// ignore: must_be_immutable
class SurahState extends Equatable {
  List<Surah> surahs;
  DataStates states;
  String errorMassage;
  @override
  List<Object?> get props => [states, surahs];

  SurahState(
      {this.states = DataStates.loading,
      this.surahs = const [],
      this.errorMassage = ""});
  SurahState copyWith({
    List<Surah>? surahs,
    DataStates? states,
    String? errorMassage,
  }) {
    return SurahState(
        surahs: surahs ?? this.surahs,
        states: states ?? this.states,
        errorMassage: errorMassage ?? this.errorMassage);
  }
}
