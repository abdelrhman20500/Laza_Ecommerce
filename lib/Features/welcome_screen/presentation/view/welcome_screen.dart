import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/welcome_screen/presentation/view/widget/build_ma_or_woman.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String routeName ="WelcomeScreen";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff9775FA),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2/3,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/screen1.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  const BuildManOrWoman(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

