import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/surah/presentation/controller/Aya%20Of%20The%20Day/aya_of_day_cubit.dart';
import 'package:quran/surah/presentation/controller/Aya%20Of%20The%20Day/aya_of_day_states.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/themes/decorations.dart';

class AyaOfDay extends StatelessWidget {
  const AyaOfDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customBoxDecorationWithShadow(
        radius: 20,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<AyaOfDayCubit, AyaOfDayStates>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "آية اليوم ",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        subtitle: Text(
                            " ${AyaOfDayCubit.get(context).getSurah(context)} - آية ${AyaOfDayCubit.get(context).getAyascounter() + 1}"),
                        leading: const Icon(Icons.book),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        AyaOfDayCubit.get(context).increase(context);
                      },
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                    const Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    IconButton(
                        onPressed: () {
                          Share.share(
                              """${AyaOfDayCubit.get(context).getSurah(context)} - آية ${AyaOfDayCubit.get(context).getAyascounter() + 1} 
                          \n ${AyaOfDayCubit.get(context).getAya(context)}""");
                        },
                        icon: const Icon(Icons.share_outlined)),
                    IconButton(
                      onPressed: () {
                        AyaOfDayCubit.get(context).decrease(context);
                      },
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                  ],
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  endIndent: 5,
                  indent: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: ScreenSize.width * .9,
                    child: Text(
                      
                      AyaOfDayCubit.get(context).getAya(context),
                      style: Theme.of(context).textTheme.headline4,
                      
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
