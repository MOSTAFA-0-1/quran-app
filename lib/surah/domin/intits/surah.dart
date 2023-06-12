import 'package:equatable/equatable.dart';

import 'ayah.dart';

class Surah extends Equatable {
  final String name, revelationType, englishName;
  final int number,ayasNumber;
  final List<Ayah> surahAyahs;
  final List audioUrls;

  const Surah({
    required this.name,
    required this.revelationType,
    required this.number,
    required this.ayasNumber,
    required this.surahAyahs,
    required this.englishName,
    required this.audioUrls
  });

  @override
  List<Object?> get props => [
        name,
        revelationType,
        number,
        surahAyahs,
        englishName,
        audioUrls,
      ];
}
