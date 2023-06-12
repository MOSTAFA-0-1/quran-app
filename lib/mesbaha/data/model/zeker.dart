import 'package:quran/mesbaha/domin/inteties/zeker.dart';

// ignore: must_be_immutable
class ZekerModel extends Zeker {
  ZekerModel({required super.zekerText, required super.counter,required super.id});

  factory ZekerModel.from(String zekerText,String id, int counter) {
    return ZekerModel(zekerText: zekerText, counter: counter,id: id);
  }
}
