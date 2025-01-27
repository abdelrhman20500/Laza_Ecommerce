import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/login_screen/presentation/view/login_screen.dart';

import '../../../sign_up_screen/presentation/view/widget/custom_button.dart';
import '../../../sign_up_screen/presentation/view/widget/custom_text_filed.dart';

class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});

  static const String routeName ="NewPasswordScreen";
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("New Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
               CustomTextField(labelText: "Password",prefixIcon: Icons.lock_clock_outlined,
                suffixIcon: Icons.remove_red_eye_outlined,controller: passwordController, type: TextInputType.text,),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
               CustomTextField(labelText: "Confirm Password",prefixIcon: Icons.lock_clock_outlined,
                suffixIcon: Icons.remove_red_eye_outlined,controller:confirmPasswordController , type: TextInputType.text,),
              SizedBox(height: MediaQuery.of(context).size.height*0.26,),
              const Text("Please write your new password.",
                textAlign:TextAlign.center ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              CustomButton(text: "Reset Password", onPressed: ()
              {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
                height: 64,width: double.infinity, color: const Color(0xff9775FA),),
            ],
          ),
        ),
      ),

    );
  }
}
