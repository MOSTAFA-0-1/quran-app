import 'package:quran/pray/domin/intits/pray.dart';

class PrayModel extends Pray {
  PrayModel({required super.time});
  factory PrayModel.fromJson(String jsonDataTime) {
    return PrayModel(time: jsonDataTime);
  }
}
