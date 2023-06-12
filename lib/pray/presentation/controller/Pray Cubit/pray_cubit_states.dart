import 'package:equatable/equatable.dart';
import 'package:quran/pray/domin/intits/pray.dart';

// ignore: must_be_immutable
class PrayStates extends Equatable {
  List<Pray> prays;
  String errorMassage;

  @override
  List<Object?> get props => [prays, errorMassage];

  PrayStates({this.prays = const [], this.errorMassage = ""});
  PrayStates copyWith({List<Pray>? prays, String? errorMassage}) {
    return PrayStates(
        prays: prays ?? this.prays,
        errorMassage: errorMassage ?? this.errorMassage);
  }
}
