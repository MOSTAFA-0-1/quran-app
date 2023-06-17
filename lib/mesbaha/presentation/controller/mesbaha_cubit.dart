import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/service.dart';
import 'package:quran/core/shared%20pref/custom_shared_pref.dart';
import 'package:quran/mesbaha/domin/usecase/mesbaha_usecase.dart';
import 'package:quran/mesbaha/presentation/controller/mesbaha_states.dart';

import '../../domin/inteties/zeker.dart';

class MesbahaCubit extends Cubit<MesbahaStates> {
  MesbahaCubit() : super(MesbahaStates());

  static MesbahaCubit get(BuildContext context) {
    return BlocProvider.of<MesbahaCubit>(context);
  }

  void getAzkar() {
    final response = sl<GetAzkar>().excute();
    response.fold((l) => emit(state.copyWith(errorMassage: l.massage)), 
    (r) {
      print(r);
      print("state list ${state.azkar}");
      emit(state.copyWith(azkar: r));
    });
  }

  
  
  late Zeker zeker;
  void zeroCounter() {
    for (zeker in state.azkar) {
      SharedPref.pref!.setInt(zeker.id, 0);
      zeker.counter = 0;
    }
    emit(state.copyWith(mState: MState.updated, errorMassage: "no error"));
    state.mState = MState.initial;
    state.errorMassage = "";
  }
}
