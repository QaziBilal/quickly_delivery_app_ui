import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

import 'Auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: customImage(klogo, sw, sw * 0.3, BoxFit.contain),
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
