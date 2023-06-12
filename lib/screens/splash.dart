import 'package:flutter/material.dart';
import 'package:quran/core/transtion/animated_navigation.dart';
import 'package:quran/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        animatedPush(context, Home());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/doaa.png")
      ),
    );
  }
}
