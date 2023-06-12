import 'package:flutter/cupertino.dart';
import 'package:quran/core/responsive/device_type_enum.dart';

double width = 0;
DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  if (mediaQueryData.orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  }
  else{
    width = mediaQueryData.size.width;
  }
  if (width >= 950) {
    return DeviceType.desktop;
  }
  if (width >= 600) {
    return DeviceType.tablet;
  }
  return DeviceType.mopile;
}
