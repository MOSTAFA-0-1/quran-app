import 'package:flutter/material.dart';
import 'package:quran/core/themes/decorations.dart';
import 'package:quran/surah/presentation/wedgits/read_more.dart';

class AyaTafsir extends StatelessWidget {
  AyaTafsir({Key? key, required this.aya, required this.tafsir})
      : super(key: key);

  String aya, tafsir;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customBoxDecoration(
          radius: 20, color: const Color.fromARGB(2, 9, 9, 9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ReadMore(title: "الاية", content: aya),
          ReadMore(title: "التفسير", content: tafsir)
        ],
      ),
    );
  }
}
