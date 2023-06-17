import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/pray/presentation/controller/Pray%20Cubit/pray_cubit.dart';
import 'package:quran/pray/presentation/controller/Pray%20Cubit/pray_cubit_states.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quran/surah/presentation/wedgits/explor.dart';
import '../pray/presentation/wedgits/pray_item.dart';
import '../surah/presentation/wedgits/aya_of_day.dart';
import '../widgets/home_image.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<Map<String, String>> praysData = [
    {"name": "الفجر", "url": "assets/images/sunrise.jpg"},
    {"name": "الشروق", "url": "assets/images/sunrise.jpg"},
    {"name": "الضهر", "url": "assets/images/sunny.jpg"},
    {"name": "العصر", "url": "assets/images/asr.jpg"},
    {"name": "المغرب", "url": "assets/images/sunset.png"},
    {"name": "العشاء", "url": "assets/images/night.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    //  SharedPref.test();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * .05, vertical: 50),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 1500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: -65.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    const Stacked(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "مواقيت الصلاة",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    BlocBuilder<PrayCubit, PrayStates>(
                      builder: (context, state) {
                        if (state.prays.isEmpty) {
                          PrayCubit.get(context).getPrays();
                          return const Center(child: CircleAvatar());
                        }
                        return SizedBox(
                            height: 150,
                            child: ListView.builder(
                              itemCount: praysData.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: PrayItem(
                                    name: praysData[index]["name"]!,
                                    imagePath: praysData[index]["url"]!,
                                    time: state.prays[index].time,
                                  ),
                                );
                              },
                            ));
                      },
                    ),
                    const AyaOfDay(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Explore()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyIndex {
  static int curretExploreindex = 0;
}
