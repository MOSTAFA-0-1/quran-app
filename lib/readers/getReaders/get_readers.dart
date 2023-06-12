import 'package:quran/readers/reader_model/reader_model.dart';

class GetReaders {
  static List<Reader> readers = [];
  static void addReaders() {
    readers.add(Reader(name: "عبد المحسن القاسم", id: 0));
    readers.add(Reader(name: "عبد الله الجهنى", id: 1));
    readers.add(Reader(name: "عبد الرحمن السديس", id: 2));
    readers.add(Reader(name: "ابراهيم الدوسرى", id: 3));
    readers.add(Reader(name: "مشارى العفاسى", id: 4));
  }
}
