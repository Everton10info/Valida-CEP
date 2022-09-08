import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 2000,
        splash: const Image(image: AssetImage('assets/images/image.png')),
        nextScreen: const HomeView(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 300.0,
      ),
    );
  }
}
