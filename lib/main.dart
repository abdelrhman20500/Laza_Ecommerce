import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/login_social/presentation/view/login_social.dart';
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
        SplashScreen.routeName:(_)=>const SplashScreen(),
        WelcomeScreen.routeName:(_)=>const WelcomeScreen(),
        LoginSocial.routeName:(_)=>LoginSocial(),
      },
      initialRoute: LoginSocial.routeName,
      home: const WelcomeScreen(),
    );
  }
}

