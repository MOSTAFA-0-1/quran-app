import 'package:quran/surah/data/model/ayah_model.dart';
import 'package:quran/surah/domin/intits/surah.dart';

class SurahModel extends Surah {
  const SurahModel(
      {required super.name,
      required super.revelationType,
      required super.number,
      required super.surahAyahs,
      required super.englishName,
      required super.audioUrls,
      required super.ayasNumber
      });

  factory SurahModel.fromJson(Map<String, dynamic> jsonMap,List ayat) => SurahModel(
      name: jsonMap["nama"].toString(),
      englishName: jsonMap["namaLatin"],
      revelationType: jsonMap["tempatTurun"] == "Madinah" ? "مدنيه":"مكيه",
      number: jsonMap["nomor"],
      audioUrls: (jsonMap["audioFull"] as Map<String,dynamic>).values.toList(growable: false),
      ayasNumber: jsonMap["jumlahAyat"],
      surahAyahs: List<AyahModel>.from(
          (ayat).map((ayah) => AyahModel.fromJson(ayah)))
      );
}
