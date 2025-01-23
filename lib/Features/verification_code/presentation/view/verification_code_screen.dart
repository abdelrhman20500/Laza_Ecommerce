import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:laza_e_commerce/Features/new_password/presentation/view/new_password_screen.dart';

import '../../../sign_up_screen/presentation/view/widget/custom_button.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  static const String routeName ="VerificationCodeScreen";

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
              const Text("Verification Code", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
              const Image(image: AssetImage("assets/images/forget_password.png"), fit: BoxFit.fill,),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              OtpTextField(
                fieldWidth: 50.0,
                numberOfFields: 4,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every text-field is filled
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              const Text("00:20 resend confirmation code.",
                textAlign:TextAlign.center ,style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w500),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              CustomButton(text: "Confirm Code", onPressed: (){
                Navigator.pushNamed(context, NewPasswordScreen.routeName);
              },height: 64,width: double.infinity, color: const Color(0xff9775FA),),
            ],
          ),
        ),
      ),

    );
  }
}
