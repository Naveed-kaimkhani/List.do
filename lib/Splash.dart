import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:to_do/Homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateSplash();
  }

  //navigate function for splash screen
  void _navigateSplash() async {
    await Future.delayed(Duration(seconds: 2));
    // Navigator.pushReplacementNamed(
    // MaterialPageRoute(builder:(context) => HomePage()));
    Get.to(Homepage());
  }

  @override
  Widget build(BuildContext context) {
    return true
        ? Scaffold(
            body: Center(
              child: Text('Splash Screen'),
            ),
          )
        :
        // ignore: dead_code
        Scaffold(
            body: Center(
                 child:AnimatedSplashScreen(
                   splash: Icons.task_alt_outlined,
                   splashIconSize: 25,
                   splashTransition: SplashTransition.slideTransition,
                   pageTransitionType: PageTransitionType.RighttoLeft, 
                   nextScreen: Homepage(), 
                ),
          ));
  }
}
