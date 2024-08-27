import 'package:flutter/material.dart';
import 'package:food_delivery/modules/splash_intro/views/intro_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Navigate to the new screen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.network(
          "https://w7.pngwing.com/pngs/55/100/png-transparent-swiggy-hd-logo-thumbnail.png",
        height: 100,
        width: 100,
      )),
    );
  }
}
