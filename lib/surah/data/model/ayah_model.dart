import 'package:quran/surah/domin/intits/ayah.dart';


class AyahModel extends Ayah {
   AyahModel({
    required super.text,
    required super.audioUrl,
    required super.number,
    required super.numberInSurah,
    required super.juz,
    required super.page,
    required super.sajdah,
  });

  factory AyahModel.fromJson(Map<String, dynamic> jsonMap) => AyahModel(
        text: jsonMap["text"],
        audioUrl: jsonMap["audio"],
        number: jsonMap["number"],
        numberInSurah: jsonMap["numberInSurah"],
        juz: jsonMap["juz"],
        page: jsonMap["page"],
        sajdah: jsonMap["sajda"].toString(),
      );
}
