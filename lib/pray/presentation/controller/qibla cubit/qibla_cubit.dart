import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran/pray/presentation/controller/qibla%20cubit/qibla_states.dart';

class QiblaCubit extends Cubit<QiblaStates> {
  QiblaCubit() : super(QiblaStates());

  static QiblaCubit get(BuildContext context) {
    return BlocProvider.of<QiblaCubit>(context);
  }

  checkPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isGranted) {
      emit(state.copyWith(hasPermission: true));
    } else {
      Permission.location.request();
    }
  }

  getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      checkPermission();
    } else {
      Geolocator.openLocationSettings();
      checkPermission();
    }
  }
}
