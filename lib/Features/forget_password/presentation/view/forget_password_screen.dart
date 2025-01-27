import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/error_dialog.dart';
import 'package:laza_e_commerce/Core/utils/loading_dialog.dart';
import 'package:laza_e_commerce/Core/utils/success_dialog.dart';
import 'package:laza_e_commerce/Features/forget_password/data/repos/reset_password_impl.dart';
import 'package:laza_e_commerce/Features/forget_password/domain/use_case/reset_password_use_case.dart';
import 'package:laza_e_commerce/Features/forget_password/presentation/view-manager/reset_password_cubit.dart';
import 'package:laza_e_commerce/Features/forget_password/presentation/view-manager/reset_password_state.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_text_filed.dart';
import 'package:laza_e_commerce/Features/verification_code/presentation/view/verification_code_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  static const String routeName ="ForgetPasswordScreen";

  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(ResetPasswordUseCase(ResetPasswordImpl(ApiService(Dio())))),
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state){
            if(state is ResetPasswordLoading)
              {
                showLoadingDialog(context);
              }else if(state is ResetPasswordFailure)
                {
                  showErrorDialog(context, state.errMessage);
                }else if(state is ResetPasswordSuccess)
                  {
                    closeLoadingDialog(context);
                    showSuccessDialog(context, state.resetPassword.message.toString());
                    Navigator.pushNamed(context, VerificationCodeScreen.routeName,
                    arguments: emailController.text);
                  }
          },
          builder: (context, state){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Forgot Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
                      const Image(image: AssetImage("assets/images/forget_password.png"), fit: BoxFit.fill,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                      CustomTextField(labelText: "Email Address",prefixIcon: Icons.email_outlined,controller:emailController , type: TextInputType.emailAddress,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.12,),
                      const Text("Please write your email to receive a\n confirmation code to set a new password.",
                        textAlign:TextAlign.center ,style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      CustomButton(text: "Confirm Mail", onPressed: ()
                      {
                        if(formKey.currentState!.validate()){
                          BlocProvider.of<ResetPasswordCubit>(context).resetPassword(
                            emailController.text,
                          );
                        }else {
                          // print("Form validation failed"); // Debugging line
                        }
                      },
                        height: 64,width: double.infinity, color: const Color(0xff9775FA),),
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
