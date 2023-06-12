import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/service.dart';
import 'package:quran/pray/presentation/controller/Pray%20Cubit/pray_cubit_states.dart';
import '../../../domin/usecase/get_prays_usecase.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

class PrayCubit extends Cubit<PrayStates> {
  PrayCubit() : super(PrayStates());

  static PrayCubit get(BuildContext context) {
    return BlocProvider.of<PrayCubit>(context);
  }

  DateTime now = DateTime.now();
  String formattedDate = "";
  late Position position;
  List<Placemark> placemarks = [];
  late PermissionStatus status;
  LocationPermission? locationPermission;
  bool isGranted = false;
  void getPrays() async {
    status = await Permission.location.request();

    if (status.isDenied) {
      await openAppSettings();
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      formattedDate = "${now.day}-${now.month}-${now.year}";
      final response = await sl<GetPrays>().excute(
          date: formattedDate,
          country: placemarks[0].country!,
          city: placemarks[0].locality!);
      response.fold((l) => emit(state.copyWith(errorMassage: l.massage)),
          (r) => emit(state.copyWith(prays: r)));
    }
  }

  int hour = 0, minute = 0, prayHour = 0, prayMinute = 0,nowHour =0;
  getNextPray() {
    now =  DateTime.now();
    if (state.prays.isNotEmpty) {
      
      for (int i = 0; i < state.prays.length; i++) {
        prayHour = int.parse(state.prays[i].time.substring(0, 2));
        prayMinute = int.parse(state.prays[i].time.substring(3, 5));
        if (state.prays[i].time.contains("AM")) {
          hour = now.hour - prayHour;
          if (now.minute > prayMinute) {
            minute = 60 - (now.minute - prayMinute);
            hour++;
          } else {
            minute = prayMinute - now.minute;
          }
          if (hour < 0) {
            return i;
          }
        } else {
          nowHour = now.hour -12;
          hour = prayHour -  nowHour;
          if (now.minute > prayMinute) {
            minute = 60 - (now.minute - prayMinute);
            hour--;
          } else {
            minute = prayMinute - now.minute;
          }
          if (hour > 0) {
            return i;
          }
        }
      }
    }
  }
}
