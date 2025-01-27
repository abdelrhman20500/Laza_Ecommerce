import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/error_dialog.dart';
import 'package:laza_e_commerce/Core/utils/loading_dialog.dart';
import 'package:laza_e_commerce/Core/utils/success_dialog.dart';
import 'package:laza_e_commerce/Features/login_screen/presentation/view/login_screen.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/data/repos/register_auth_repo_impl.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/domain/use_case/register_use_case.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_text_filed.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/row_option.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view_manager/register_cubit.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view_manager/register_state.dart';

class SignUpScreen extends StatefulWidget {
    const SignUpScreen({super.key});

  static const String routeName= "SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  bool isSwitch = false;
  final TextEditingController userName =TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(RegisterUseCase(RegisterAuthRepoImpl(ApiService(Dio())))),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state){
            if(state is RegisterLoading)
              {
                showLoadingDialog(context);
              }else if(state is RegisterSuccess)
                {
                  closeLoadingDialog(context);
                  showSuccessDialog(context, state.authRegister.message.toString());
                  // print(state.authRegister.message);
                }else if(state is RegisterFailure)
                  {
                    // print(state.errMessage);
                    showErrorDialog(context, state.errMessage);
                  }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.13,),
                      CustomTextField(labelText: "User Name",type: TextInputType.text,controller:userNameController,prefixIcon: Icons.person,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      CustomTextField(labelText: "Email",type: TextInputType.emailAddress,controller:emailController,prefixIcon: Icons.email,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      CustomTextField(labelText: "password",type: TextInputType.visiblePassword,controller:passwordController,suffixIcon: Icons.remove_red_eye,prefixIcon: Icons.lock_clock_outlined,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      RowOption(title: "Remember me", switchValue: isSwitch, onChanged: (newSwitch)
                      {
                        setState(() {
                          isSwitch= newSwitch;
                        });
                      }),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      CustomButton(text: "Sign Up", onPressed: ()
                      {
                        if(formKey.currentState!.validate()){
                          BlocProvider.of<RegisterCubit>(context).register(
                            userNameController.text,
                            emailController.text,
                            passwordController.text,
                            isSwitch,
                          );
                        }else {
                          // print("Form validation failed"); // Debugging line
                        }
                      },
                        height: 64,width: double.infinity,color: const Color(0xff9775FA),),
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
          },
        ),
      ),
    );
   }
}

