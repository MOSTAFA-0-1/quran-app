import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quran/core/responsive/device_type_enum.dart';

// ignore: must_be_immutable
class DeviceInfo extends Equatable {
  DeviceType diviceType;
  Orientation orientation;
  double screenHeight;
  double screenWidth;
  double parentHeight;
  double parentWidth;

  DeviceInfo({
    required this.diviceType,
    required this.orientation,
    required this.screenHeight,
    required this.screenWidth,
    required this.parentHeight,
    required this.parentWidth,
  });
  
  @override
  List<Object?> get props => [
        diviceType,
        orientation,
        screenHeight,
        screenWidth,
        parentHeight,
        parentWidth
      ];
}
