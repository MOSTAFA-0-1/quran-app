import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custon%20controller/custom_state.dart';
import 'package:quran/core/custon%20controller/rebuild_cubit.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/core/shared%20pref/custom_shared_pref.dart';
import 'package:quran/core/themes/decorations.dart';
import 'package:quran/mesbaha/domin/inteties/zeker.dart';
import 'package:quran/mesbaha/presentation/controller/mesbaha_cubit.dart';
import 'package:quran/mesbaha/presentation/controller/mesbaha_states.dart';

class Azkar extends StatelessWidget {
  const Azkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * .07,vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset("assets/images/mesbaha.png"),
                ),
                BlocBuilder<MesbahaCubit, MesbahaStates>(
                  builder: (context, state) {
                    MesbahaCubit.get(context).getAzkar();
                    if (state.azkar.isNotEmpty) {
                      return SizedBox(
                        height: ScreenSize.height * .8,
                        child: ListView.builder(
                          itemCount: state.azkar.length,
                          itemBuilder: (context, index) {
                            return ZekerUi(zeker: state.azkar[index]);
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(state.errorMassage),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MesbahaCubit.get(context).zeroCounter();
          },
          child: const Text("0"),
        ));
  }
}

class ZekerUi extends StatelessWidget {
  ZekerUi({Key? key, required this.zeker}) : super(key: key);
  Zeker zeker;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        zeker.counter++;
        SharedPref.pref!.setInt(zeker.id, zeker.counter);
        RebuildCubit.get(context).rebuild();
      },
      child: Container(
        width: ScreenSize.width * .85,
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 100,
        decoration: customBoxDecoration(radius: 20, color: Colors.amber),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          BlocBuilder<RebuildCubit, CustomStates>(
            builder: (context, state) {
              return Text(
                "${zeker.counter}",
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
          Text(
            zeker.zekerText,
            style: Theme.of(context).textTheme.headline4,
          ),
        ]),
      ),
    );
  }
}
