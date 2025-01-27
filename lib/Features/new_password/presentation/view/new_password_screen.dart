import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/error_dialog.dart';
import 'package:laza_e_commerce/Core/utils/loading_dialog.dart';
import 'package:laza_e_commerce/Core/utils/success_dialog.dart';
import 'package:laza_e_commerce/Features/login_screen/presentation/view/login_screen.dart';
import 'package:laza_e_commerce/Features/new_password/data/repo/update_password_repo_impl.dart';
import 'package:laza_e_commerce/Features/new_password/domain/use_case/update_password_use_case.dart';
import 'package:laza_e_commerce/Features/new_password/presentation/view_manager/up_date_password_cubit.dart';
import 'package:laza_e_commerce/Features/new_password/presentation/view_manager/up_date_password_state.dart';
import '../../../sign_up_screen/presentation/view/widget/custom_button.dart';
import '../../../sign_up_screen/presentation/view/widget/custom_text_filed.dart';

class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});

  static const String routeName ="NewPasswordScreen";
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
     final String email = ModalRoute.of(context)!.settings.arguments as String;
     return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
        ),
      body: BlocProvider(
        create: (context) => UpDatePasswordCubit(UpdatePasswordUseCase(UpdatePasswordRepoImpl(ApiService(Dio())))),
        child: BlocConsumer<UpDatePasswordCubit, UpDatePasswordState>(
          listener: (context, state){
            if(state is UpDatePasswordLoading)
              {
                showLoadingDialog(context);
              }else if(state is UpDatePasswordFailure)
                {
                  showErrorDialog(context, state.errMessage);
                }else if(state is UpDatePasswordSuccess)
                  {
                    closeLoadingDialog(context);
                    showSuccessDialog(context, state.updatePassword.message.toString());
                  }
          },
          builder: (context, state){
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("New Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                      CustomTextField(labelText: "New Password",prefixIcon: Icons.lock_clock_outlined,
                        suffixIcon: Icons.remove_red_eye_outlined,controller: newPasswordController, type: TextInputType.text,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      CustomTextField(labelText: "Confirm Password",prefixIcon: Icons.lock_clock_outlined,
                        suffixIcon: Icons.remove_red_eye_outlined,controller:confirmPasswordController , type: TextInputType.text,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.26,),
                      const Text("Please write your new password.",
                        textAlign:TextAlign.center ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      CustomButton(text: "Reset Password", onPressed: ()
                      {
                        if(formKey.currentState!.validate()){
                          BlocProvider.of<UpDatePasswordCubit>(context).update(
                              email,
                              newPasswordController.text,
                              confirmPasswordController.text
                          );
                        }
                        Navigator.pushNamed(context, LoginScreen.routeName);
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
