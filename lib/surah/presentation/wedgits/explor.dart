import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/custon controller/custom_state.dart';
import '../../../core/custon controller/rebuild_cubit.dart';
import '../../../mesbaha/presentation/screens/azkar.dart';
import '../../../pray/presentation/screens/pray_times.dart';
import '../../../pray/presentation/screens/qibla.dart';
import '../../../screens/readers.dart';
import '../../../widgets/explore_item.dart';
import '../screens/tafsir_books.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: BlocBuilder<RebuildCubit, CustomStates>(
        builder: (context, state) {
          return GridView.count(
            padding: const EdgeInsets.all(2),
            crossAxisCount: 2,
            primary: false,
            childAspectRatio: 1.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              ExploreItem(
                title: "القرأن الكريم",
                subTitle: "اقرأ & استمع",
                screen: const Readers(),
                id: 0,
              ),
              ExploreItem(
                title: "المسبحة",
                subTitle: "سبح بحمد الله",
                screen: const Azkar(),
                id: 1,
              ),
              ExploreItem(
                title: "اتجاه القبلة",
                subTitle: "جد قبلتك",
                screen: const QiblahScreen(),
                id: 2,
              ),
              ExploreItem(
                title: "مواقيت الصلاة",
                subTitle: "عماد الدين",
                screen: PrayTimes(),
                id: 3,
              ),
              ExploreItem(
                title: "التفسير",
                subTitle: "افهم",
                screen: const TafsirBooks(),
                id: 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
