import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/sign_up_screen.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_text_filed.dart';

import '../../../sign_up_screen/presentation/view/widget/custom_button.dart';
import '../../../sign_up_screen/presentation/view/widget/row_option.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName ="LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              const Text("Please enter your data to continue", style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.grey),),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              const CustomTextField(labelText: "User Name",type: TextInputType.text,prefixIcon: Icons.person,),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              const CustomTextField(labelText: "password",type: TextInputType.visiblePassword,suffixIcon: Icons.remove_red_eye,prefixIcon: Icons.lock_clock_outlined,),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: (){}, child: const Text("forget password ?",style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w400, color: Colors.red),),),
              ),
              RowOption(title: "Remember me", switchValue: isSwitch, onChanged: (newSwitch)
              {
                setState(() {
                  isSwitch= newSwitch;
                });
              }),
              SizedBox(height: MediaQuery.of(context).size.height*0.12,),
              const Text("By connecting your account confirm that you agree with our Term and Condition",
              textAlign: TextAlign.center,),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              CustomButton(text: "Login", onPressed: (){}, height: 64,width: double.infinity,color: const Color(0xff9775FA),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account ?  ", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                  InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: const Text("Sign Up", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),))

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
