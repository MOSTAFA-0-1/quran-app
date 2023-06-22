import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/service.dart';
import 'package:quran/core/shared%20pref/custom_shared_pref.dart';
import 'package:quran/mesbaha/domin/usecase/mesbaha_usecase.dart';
import 'package:quran/mesbaha/presentation/controller/mesbaha_states.dart';

import '../../domin/inteties/zeker.dart';

class MesbahaCubit extends Cubit<MesbahaStates> {
  MesbahaCubit() : super(MesbahaInitialState());
  List<Zeker> azkar = [];
  static MesbahaCubit get(BuildContext context) {
    return BlocProvider.of<MesbahaCubit>(context);
  }

  void getAzkar() {
    final response = sl<GetAzkar>().excute();
    response.fold((l) => emit(MesbahaErrorState()), (r) {
      azkar = r;
      print(r);
      print(azkar);
      emit(MesbahaUpdateState());
    });
  }

  late Zeker zeker;
  void zeroCounter() {
    for (zeker in azkar) {
      SharedPref.pref!.setInt(zeker.id, 0);
      zeker.counter = 0;
    }
    emit(MesbahaUpdateState());
  }
}
