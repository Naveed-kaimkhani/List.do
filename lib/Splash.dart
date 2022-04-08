import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_do/Homepage.dart';
//import page transition package


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
   // _navigateSplash();
  }

  //navigate function for splash screen
  void _navigateSplash() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(Homepage());
  }

  @override
  Widget build(BuildContext context) {
    return !true
        // ignore: dead_code
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
                   splash:Text("Wellcome to list.do",style: TextStyle(fontSize: 30),),
                   duration: 5,
                   splashIconSize: 25,
                   splashTransition: SplashTransition.fadeTransition,
                   pageTransitionType: PageTransitionType.rightToLeft, 
                   nextScreen: Homepage(), 
                ),
          ));
  }
}
