import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/forget_password/presentation/view/forget_password_screen.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_screen.dart';
import 'package:laza_e_commerce/Features/login_screen/presentation/view/login_screen.dart';
import 'package:laza_e_commerce/Features/login_social/presentation/view/login_social.dart';
import 'package:laza_e_commerce/Features/new_password/presentation/view/new_password_screen.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/sign_up_screen.dart';
import 'package:laza_e_commerce/Features/verification_code/presentation/view/verification_code_screen.dart';
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
      // home:  VerificationCodeScreen(),
      routes: {
        SplashScreen.routeName:(_)=>const SplashScreen(),
        WelcomeScreen.routeName:(_)=>const WelcomeScreen(),
        LoginSocial.routeName:(_)=>const LoginSocial(),
        SignUpScreen.routeName:(_)=>const SignUpScreen(),
        LoginScreen.routeName:(_)=>const LoginScreen(),
        ForgetPasswordScreen.routeName:(_)=> ForgetPasswordScreen(),
        VerificationCodeScreen.routeName:(_)=>const VerificationCodeScreen(),
        NewPasswordScreen.routeName:(_)=> NewPasswordScreen(),
        HomeScreen.routeName:(_)=>const HomeScreen(),
      },
      initialRoute: SignUpScreen.routeName,
    );
  }
}

