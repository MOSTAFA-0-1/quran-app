import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custon%20controller/custom_state.dart';

class RebuildCubit extends Cubit<CustomStates> {
  RebuildCubit() : super(InitState());
  static RebuildCubit get(BuildContext context) {
    return BlocProvider.of<RebuildCubit>(context);
  }

  rebuild() {
    emit(RebuildState());
  }
}
