import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/HomePage.dart';

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
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
