import 'package:flutter/material.dart';

BoxDecoration customBoxDecorationWithImage(double radius, String imagePath) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
    ),
  );
}

BoxDecoration customBoxDecoration({double? radius, Color? color}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0), color: color);
}

BoxDecoration customBoxDecorationWithShadow(
    {double? radius, Color? color}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius ?? 0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 15,
          offset: const Offset(0, 2),
        )
      ]);
}
