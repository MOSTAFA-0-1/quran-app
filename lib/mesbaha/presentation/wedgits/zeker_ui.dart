import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/custon controller/custom_state.dart';
import '../../../core/custon controller/rebuild_cubit.dart';
import '../../../core/screen_size/screen_size.dart';
import '../../../core/shared pref/custom_shared_pref.dart';
import '../../../core/themes/decorations.dart';
import '../../domin/inteties/zeker.dart';

class ZekerUi extends StatelessWidget {
  ZekerUi({Key? key, required this.zeker}) : super(key: key);
  Zeker zeker;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       zeker.counter++;
        SharedPref.pref!.setInt(zeker.id, zeker.counter);
        // print( SharedPref.pref!.getInt(zeker.id));
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
