import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/welcome_screen/presentation/view/welcome_screen.dart';
import 'Features/splash_screen/presentation/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        WelcomeScreen.routeName:(_)=>WelcomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
      home: const WelcomeScreen(),
    );
  }
}

