import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran/pray/presentation/controller/qibla%20cubit/qibla_cubit.dart';
import 'package:quran/pray/presentation/controller/qibla%20cubit/qibla_states.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        body: BlocBuilder<QiblaCubit, QiblaStates>(
          builder: (context, state) {
            QiblaCubit.get(context).getPermission();
            if (state.hasPermission) {
              return StreamBuilder(
                stream: FlutterQiblah.qiblahStream,
                builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ));
                  }
                  if (snapshot.hasData) {
                    final qiblahDirection = snapshot.data;
                    animation = Tween(
                            begin: begin,
                            end: (qiblahDirection!.direction * (pi / 180) *-1))
                        .animate(_animationController!);
                    begin = (qiblahDirection.direction * (pi / 180) * -1);
                    _animationController!.forward(from: 0);

                    return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${qiblahDirection.direction.toInt()}°",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                height: 300,
                                child: AnimatedBuilder(
                                  animation: animation!,
                                  builder: (context, child) => Transform.rotate(
                                      angle: animation!.value,
                                      child: Image.asset(
                                          'assets/images/qipla.png')),
                                ))
                          ]),
                    );
                  }
                  return Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            await Permission.location.request();
                          },
                          child: const Text("Get location permission")));
                },
              );
            } else {
              return const Text("");
            }
          },
        ),
      ),
    );
  }
}
