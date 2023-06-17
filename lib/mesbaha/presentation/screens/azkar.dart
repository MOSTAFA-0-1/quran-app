import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/screen_size/screen_size.dart';
import 'package:quran/mesbaha/presentation/controller/mesbaha_cubit.dart';
import 'package:quran/mesbaha/presentation/controller/mesbaha_states.dart';
import '../wedgits/zeker_ui.dart';

class Azkar extends StatelessWidget {
  const Azkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mesbahaCubit = MesbahaCubit.get(context);
    mesbahaCubit.getAzkar();
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * .07, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset("assets/images/mesbaha.png"),
                ),
                BlocBuilder<MesbahaCubit, MesbahaStates>(
                  builder: (context, state) {
                    if (mesbahaCubit.azkar.isNotEmpty) {
                      return SizedBox(
                        height: ScreenSize.height * .8,
                        child: ListView.builder(
                          itemCount: mesbahaCubit.azkar.length,
                          itemBuilder: (context, index) {
                            return ZekerUi(zeker: mesbahaCubit.azkar[index]);
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("Not found"),
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
            mesbahaCubit.zeroCounter();
          },
          child: const Text("0"),
        ));
  }
}
