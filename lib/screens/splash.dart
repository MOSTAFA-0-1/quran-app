import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran/core/transtion/animated_navigation.dart';
import 'package:quran/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isGranted = true;

  void checkPermission() async {
    final locationPermissionStatus = await Permission.location.status;

    if (locationPermissionStatus.isGranted) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          animatedPush(context, Home());
        },
      );
    } else if (locationPermissionStatus.isDenied ||
        locationPermissionStatus.isPermanentlyDenied) {
      final locationPermission = await Permission.location.request();

      if (locationPermission.isGranted) {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            animatedPush(context, Home());
          },
        );
      }
    }
  }

  isGrant() async {
    final locationPermissionStatus = await Permission.location.status;

   if (!locationPermissionStatus.isGranted && isGranted) {
     setState(() {
       isGranted = false;
     });
   }
    print("hello");
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isGrant();
    return Scaffold(
      body: isGranted
          ? Center(child: Image.asset("assets/images/doaa.png"))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "لابد من السماح بالوصول للموقع للتمكن من اكمال الدخول للتطبيق"),
                  TextButton(
                      onPressed: () async {
                        final locationPermission =
                            await Permission.location.request();

                        if (locationPermission.isGranted) {
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              setState(() {
                                isGranted = true;
                              });
                              animatedPush(context, Home());
                            },
                          );
                        }
                      },
                      child: const Text("اعطاء الاذن"))
                ],
              ),
            ),
    );
  }
}
