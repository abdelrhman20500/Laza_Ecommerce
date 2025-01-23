import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/login_social/presentation/view/widget/build_social_item.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/sign_up_screen.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';

class LoginSocial extends StatelessWidget {
  const LoginSocial({super.key});

  static const String routeName = " LoginSocial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back),),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Let’s Get Started", textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
              const BuildSocialItem(color: Colors.blue,title: "Facebook",icon: Icons.facebook,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              const BuildSocialItem(color: Color(0xff1DA1F2),title: "Twitter",icon: Icons.facebook,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              const BuildSocialItem(color: Color(0xffEA4335),title: "Google",icon: Icons.facebook,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.14,),
              CustomButton(text: "Create an Account", color: const Color(0xff9775FA), height: 64,onPressed: (){
                Navigator.pushNamed(context, SignUpScreen.routeName);
              })
            ],
          ),
        ),
      ),
    );
  }
}

