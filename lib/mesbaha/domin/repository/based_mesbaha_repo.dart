 
import 'package:quran/mesbaha/domin/inteties/zeker.dart';

abstract class BasedMesbahaRepository {
  List<Zeker> getAzkar();
  void setzeker(String text,int index);

}