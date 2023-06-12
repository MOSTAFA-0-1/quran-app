import 'package:equatable/equatable.dart';

class Zeker extends Equatable {
  
  String zekerText , id;
  int counter;
  

  Zeker({
      required this.id,
      required this.zekerText,
      required this.counter,
    });
  
  @override
  List<Object?> get props => [zekerText,counter];
}
