import 'package:flutter/material.dart';
// import 'package:google_fonts_arabic/fonts.dart';
import 'package:quran/core/custom_variables.dart';
import 'package:persian_fonts/persian_fonts.dart';
// import 'package:google_fonts_arabic/google_fonts_arabic.dart';

class SurahUi extends StatelessWidget {
  SurahUi(
      {Key? key,
      required this.surahName,
      required this.englishName,
      required this.ayahsNumber,
      required this.revelationType})
      : super(key: key);

  String surahName, revelationType, englishName;
  int ayahsNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: customVar.getListnerCubit(context).isAndroid()
          ? SizedBox(
            height: 80,
            child: Column(
             
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            englishName,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 121, 11, 112),
                                fontSize: 18),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 70,
                              child: Text(
                                surahName,
                                style: const TextStyle(fontSize: 20,fontFamily: "kit"),
                                // style: PersianFonts.Sahel,
                                 textDirection: TextDirection.rtl,
                                
                              ),
                            ),
                            if (ayahsNumber < 11)
                              Text(
                                "$revelationType . $ayahsNumber آيات ",
                                textDirection: TextDirection.rtl,
                              )
                            else
                              Text(
                                "$revelationType . $ayahsNumber آيه  ",
                                textDirection: TextDirection.rtl,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 8,),
                  const Divider(
                    height: 3,
                    endIndent: 5,
                    indent: 5,
                    thickness: 2,
                  )
                ],
              ),
          )

          // ? SizedBox(
          //   width: double.infinity,
          //   child: ListTile(
          //       title: Text(revelationType),
          //       subtitle: const Text("مشارى العفاسى"),
          //       tileColor: const Color.fromARGB(100, 205, 204, 204),
          //       trailing: SizedBox(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           children: [
          //             Text(surahName, style: const TextStyle(fontSize: 15),textDirection: TextDirection.rtl,softWrap: false,),
          //             if (ayahsNumber < 11)
          //               Text("$ayahsNumber آيات ")
          //             else
          //               Text("$ayahsNumber آيه  ")
          //           ],
          //         ),
          //       ),
          //     ),
          // )
          : Center(),
    );
  }
}
