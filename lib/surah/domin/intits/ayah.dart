import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final int number, numberInSurah, juz, page;
  final String text, audioUrl;
  final String sajdah;
  String? tafsirText;
   Ayah({
    required this.text,
    required this.audioUrl,
    required this.number,
    required this.numberInSurah,
    required this.juz,
    required this.page,
    required this.sajdah,
  });

  @override
  List<Object?> get props => [
        text,
        audioUrl,
        number,
        numberInSurah,
        juz,
        page,
        sajdah,
      ];
}
