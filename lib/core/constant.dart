// ignore: camel_case_types
class constant {
  static String basedApiUrl = "https://equran.id/api/v2/surat";
  static String basedApiUrlAyat =
      "http://api.alquran.cloud/v1/quran/ar.alafasy";
  static String basedTafsirUrl(int tafsirId, int suraNumber, int ayaNumber) {
    return "http://api.quran-tafseer.com/tafseer/$tafsirId/$suraNumber/1/$ayaNumber";
  }
  static String basedPrayUrl(String date,String country,String city){
    return "https://api.aladhan.com/v1/timingsByCity/$date?city=$city&country=$country";
  }
  static String zeker = "zeker";
  static String zekerCounter (int index){
    return "zeker$index Counter";
  }

}
