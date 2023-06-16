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
