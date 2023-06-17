import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custon%20controller/custom_state.dart';
import 'package:quran/core/custon%20controller/rebuild_cubit.dart';
import 'package:quran/core/themes/custom_styles.dart';
import 'package:quran/core/themes/decorations.dart';
import 'package:quran/pray/presentation/controller/Pray%20Cubit/pray_cubit.dart';
import 'package:quran/pray/presentation/controller/Pray%20Cubit/pray_cubit_states.dart';

class PrayTimes extends StatelessWidget {
  PrayTimes({Key? key}) : super(key: key);
  List<String> arPrays = [
    "الفجر",
    "الشروق",
    "الظهر",
    "العصر",
    "المغرب",
    "العشاء"
  ];
  List<IconData> icons = [Icons.sunny];
  @override
  Widget build(BuildContext context) {
    PrayCubit.get(context).getPrays();

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(94, 94, 94, 1)),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "الصلاة القادمة",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      BlocBuilder<RebuildCubit, CustomStates>(
                        builder: (context, state) {
                          return Text(
                              PrayCubit.get(context).getNextPray() == null
                                  ? ""
                                  : arPrays[
                                      PrayCubit.get(context).getNextPray()],
                              style: Theme.of(context).textTheme.headline2);
                        },
                      ),
                      const Divider(
                        color: Colors.white24,
                        thickness: 2,
                        endIndent: 90,
                      ),
                    ],
                  )),
                  DottedBorder(
                    borderType: BorderType.Circle,
                    strokeWidth: 5,
                    dashPattern: const [10, 10],
                    color: Colors.amber,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: customBoxDecoration(radius: 45),
                      child:
                          Center(child: BlocBuilder<RebuildCubit, CustomStates>(
                        builder: (context, state) {
                          return Text(
                            "${PrayCubit.get(context).hour.abs()}  :  ${PrayCubit.get(context).minute}",
                            style: CustomStyles.headline1,
                            textDirection: TextDirection.ltr,
                          );
                        },
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<PrayCubit, PrayStates>(
                builder: (context, state) {
                  if (state.prays.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: arPrays.length,
                    itemBuilder: (context, index) {
                      RebuildCubit.get(context).rebuild();
                      return Container(
                        color: index == PrayCubit.get(context).getNextPray()
                            ? Colors.amber
                            : null,
                        child: ListTile(
                          selectedColor: Colors.amber,
                          title: Text(
                            arPrays[index],
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          trailing: Text(
                            "${state.prays[index].time} ",
                            textDirection: TextDirection.ltr,
                          ),
                          leading: const Icon(Icons.sunny),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
