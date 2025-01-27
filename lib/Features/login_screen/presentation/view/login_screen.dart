import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/error_dialog.dart';
import 'package:laza_e_commerce/Core/utils/loading_dialog.dart';
import 'package:laza_e_commerce/Core/utils/success_dialog.dart';
import 'package:laza_e_commerce/Features/forget_password/presentation/view/forget_password_screen.dart';
import 'package:laza_e_commerce/Features/login_screen/data/repos/auth_repo_impl.dart';
import 'package:laza_e_commerce/Features/login_screen/domain/use_cases/login_use_case.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/sign_up_screen.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_text_filed.dart';
import '../../../sign_up_screen/presentation/view/widget/custom_button.dart';
import '../../../sign_up_screen/presentation/view/widget/row_option.dart';
import '../view_manager/login_cubit.dart';
import '../view_manager/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName ="LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSwitch = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
        create: (context) => LoginCubit(LoginUseCase(AuthRepoImpl(ApiService(Dio())))),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              // You can show a loading indicator or message here
              showLoadingDialog(context);
            } else if (state is LoginFailure) {
              // print(state.errMessage);
              showErrorDialog(context, state.errMessage);
            } else if (state is LoginSuccess) {
              closeLoadingDialog(context);
              showSuccessDialog(context, "Login Successfully");
              // print(state.authLogin.token); // Adjust based on your response structure
              // Navigate to the next screen or show success message
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Welcome", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                      const Text("Please enter your data to continue", style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                      CustomTextField(labelText: "Email",type: TextInputType.emailAddress,controller:emailController ,prefixIcon: Icons.email,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      CustomTextField(labelText: "password",type: TextInputType.visiblePassword,controller:passwordController ,suffixIcon: Icons.remove_red_eye,prefixIcon: Icons.lock_clock_outlined,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(onPressed: ()
                        {
                          Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                        }, child: const Text("forget password ?",style: TextStyle(
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
                      CustomButton(
                        text: "Login",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              emailController.text,
                              passwordController.text,
                              isSwitch,
                            );
                          } else {
                            // print("Form validation failed"); // Debugging line
                          }
                        },
                        height: 64,
                        width: double.infinity,
                        color: const Color(0xff9775FA),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don’t have an account ?  ", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, SignUpScreen.routeName);
                              },
                              child: const Text("Sign Up", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),)),
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
