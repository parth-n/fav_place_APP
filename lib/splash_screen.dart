import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:place_x/screens/places.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(
        "assets/Lottie/Animation - 1724694738559.json",
        onLoaded: (composition) {
          // Optional: Perform any action when the animation is fully loaded
        },
      ),
      nextScreen: const PlacesScreen(),
      splashIconSize: 400,
      animationDuration: const Duration(seconds: 3),
      backgroundColor: Colors.blue[200]!,
    );
  }
}
