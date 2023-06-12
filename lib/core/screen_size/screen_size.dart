import 'dart:ui';

class ScreenSize {
  static double width = 0, height = 0;
  static void getSize(Size size) {
    height = size.height;
    width = size.width;
  }
}
