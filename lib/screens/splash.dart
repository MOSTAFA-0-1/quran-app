import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran/core/transtion/animated_navigation.dart';
import 'package:quran/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void checkPermission() async {
    final locationPermmession = await Permission.location.isDenied;

    if (locationPermmession) {
      await Permission.location.request().then((value) {
        if (!value.isDenied) {
          Future.delayed(
            const Duration(seconds: 1),
            () {
              animatedPush(context, Home());
            },
          );
        } else {
          SystemNavigator.pop();
        }
      });
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          animatedPush(context, Home());
        },
      );
    }
  }

  @override
  void initState()  {
    checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/doaa.png")),
    );
  }
}
