import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/error_dialog.dart';
import 'package:laza_e_commerce/Core/utils/loading_dialog.dart';
import 'package:laza_e_commerce/Core/utils/success_dialog.dart';
import 'package:laza_e_commerce/Features/new_password/presentation/view/new_password_screen.dart';
import 'package:laza_e_commerce/Features/verification_code/data/repo/vertification_code_impl.dart';
import 'package:laza_e_commerce/Features/verification_code/domain/use_case/verification_code_use_case.dart';
import 'package:laza_e_commerce/Features/verification_code/presentation/view_manager/verification_code_cubit.dart';
import 'package:laza_e_commerce/Features/verification_code/presentation/view_manager/verification_code_state.dart';
import '../../../sign_up_screen/presentation/view/widget/custom_button.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  static const String routeName ="VerificationCodeScreen";


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
        create: (context) => VerificationCodeCubit(VerificationCodeUseCase(VerificationCodeImpl(ApiService(Dio())))),
        child: BlocConsumer<VerificationCodeCubit, VerificationCodeState>(
          listener: (context, state){
            if(state is VerificationCodeLoading)
              {
                showLoadingDialog(context);
              }else if(state is VerificationCodeSuccess)
                {
                  print(state.verificationCode.message);
                  closeLoadingDialog(context);
                  showSuccessDialog(context, state.verificationCode.message.toString());
                }else if(state is VerificationCodeFailure)
                {
                  showErrorDialog(context,state.errMessage);
                }
          },
          builder: (context, state) {
            return Padding(
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
                        BlocProvider.of<VerificationCodeCubit>(context).verifyCode(
                            verificationCode,
                            email,
                        );
                        // showDialog(
                        //     context: context,
                        //     builder: (context){
                        //       return AlertDialog(
                        //         title: const Text("Verification Code"),
                        //         content: Text('Code entered is $verificationCode'),
                        //       );
                        //     }
                        // );
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
            );
          } ,
        ),
      ),
    );
  }
}
