import 'package:flutter/material.dart';
import 'package:quran/core/constants/tafsir_const.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/surah/presentation/wedgits/tafsir_book.dart';

class TafsirBooks extends StatelessWidget {
  const TafsirBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/quran_background.png"),
                fit: BoxFit.contain)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: ScreenSize.height * .95,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: TafsirConst.tafsirData
                      .map((tafsir) => TafsirBook(
                            tafsir: tafsir,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
