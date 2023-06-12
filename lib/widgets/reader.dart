import 'package:flutter/material.dart';
import 'package:quran/core/transtion/animated_navigation.dart';
import 'package:quran/surah/presentation/screens/surahs_ui.dart';

class Reader extends StatelessWidget {
   Reader({Key? key,required this.readerName,required this.id}) : super(key: key);
  String readerName;
  int id;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: InkWell(
          onTap: () {
            animatedPush(context, SurahsUi(readerId: id));
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/reader_icon2.png"),
                
                  Text(
                    readerName,
                    style: Theme.of(context).textTheme.headline6,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              )),
            ),
          ),
        ),
      
    );
  }
}
