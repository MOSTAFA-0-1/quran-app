import 'package:flutter/material.dart';
import 'package:quran/core/functions/get_orientation.dart';
import 'package:quran/core/responsive/device_info.dart';

class WidgetInfo extends StatelessWidget {
  WidgetInfo({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;
  MediaQueryData? mediaQueryData;
  DeviceInfo? deviceInfo;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      mediaQueryData = MediaQuery.of(context);
      deviceInfo = DeviceInfo(
          diviceType: getDeviceType(mediaQueryData!),
          orientation: mediaQueryData!.orientation,
          screenHeight: mediaQueryData!.size.height,
          screenWidth: mediaQueryData!.size.width,
          parentHeight: constraints.maxHeight,
          parentWidth: constraints.maxWidth);
      return builder(context, deviceInfo!);
    });
  }
}
