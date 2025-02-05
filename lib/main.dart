import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laza_e_commerce/Features/forget_password/presentation/view/forget_password_screen.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_screen.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/login_screen/presentation/view/login_screen.dart';
import 'package:laza_e_commerce/Features/login_social/presentation/view/login_social.dart';
import 'package:laza_e_commerce/Features/new_password/presentation/view/new_password_screen.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/review_screen.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/widget/add_review.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/sign_up_screen.dart';
import 'package:laza_e_commerce/Features/verification_code/presentation/view/verification_code_screen.dart';
import 'package:laza_e_commerce/Features/welcome_screen/presentation/view/welcome_screen.dart';
import 'package:laza_e_commerce/constant.dart';
import 'Core/utils/shared_preferences.dart';
import 'Core/utils/simple_bloc_observer.dart';
import 'Features/splash_screen/presentation/view/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>(kFeaturedBox);
  Bloc.observer= SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:  ProductDetails(),
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
        ReviewScreen.routeName:(_)=>const ReviewScreen(),
        AddReview.routeName:(_)=> AddReview(),

        // ProductDetailsScreen.routeName:(_)=>ProductDetailsScreen(),
        // SearchScreen.routeName:(_)=> SearchScreen(),
        // ProductByCategoryId.routeName:(_)=>const ProductByCategoryId(),
      },
      initialRoute: ReviewScreen.routeName,
      // initialRoute: SharedPref.getToken() == null ?SplashScreen.routeName : HomeScreen.routeName,
    );
  }
}

