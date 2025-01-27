import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_text_filed.dart';
import 'package:laza_e_commerce/Features/verification_code/presentation/view/verification_code_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  static const String routeName ="ForgetPasswordScreen";

  final TextEditingController passwordController = TextEditingController();
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
              const Text("Forgot Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
              const Image(image: AssetImage("assets/images/forget_password.png"), fit: BoxFit.fill,),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              CustomTextField(labelText: "Email Address",prefixIcon: Icons.email_outlined,controller:passwordController , type: TextInputType.emailAddress,),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              const Text("Please write your email to receive a\n confirmation code to set a new password.",
                textAlign:TextAlign.center ,style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w400),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              CustomButton(text: "Confirm Mail", onPressed: ()
              {
                Navigator.pushNamed(context, VerificationCodeScreen.routeName);
              },
                height: 64,width: double.infinity, color: const Color(0xff9775FA),),
            ],
          ),
        ),
      ),
    );
  }
}
