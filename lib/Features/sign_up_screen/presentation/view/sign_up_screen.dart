import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/login_screen/presentation/view/login_screen.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_text_filed.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/row_option.dart';

class SignUpScreen extends StatefulWidget {
    const SignUpScreen({super.key});

  static const String routeName= "SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userName =TextEditingController();

  bool isSwitch = false;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              SizedBox(height: MediaQuery.of(context).size.height*0.13,),
              const CustomTextField(labelText: "User Name",type: TextInputType.text,prefixIcon: Icons.person,),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              const CustomTextField(labelText: "Email",type: TextInputType.emailAddress,prefixIcon: Icons.email,),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              const CustomTextField(labelText: "password",type: TextInputType.visiblePassword,suffixIcon: Icons.remove_red_eye,prefixIcon: Icons.lock_clock_outlined,),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              RowOption(title: "Remember me", switchValue: isSwitch, onChanged: (newSwitch)
              {
                  setState(() {
                    isSwitch= newSwitch;
                  });
              }),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              CustomButton(text: "Sign Up", onPressed: (){}, height: 64,width: double.infinity,color: const Color(0xff9775FA),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You already have an account ?  ", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                  InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: const Text("Login", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),))

                ],
              )


            ],
          ),
        ),
      ),
    );
   }
}

