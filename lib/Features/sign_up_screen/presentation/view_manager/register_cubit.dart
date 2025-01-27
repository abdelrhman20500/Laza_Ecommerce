import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/domain/use_case/register_use_case.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view_manager/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register(String name, String email, String password, bool remember) async {
    emit(RegisterLoading());
    try {
      final result = await registerUseCase.call(
        name: name,
        email: email,
        password: password,
        remember: remember,
      );
      emit(RegisterSuccess(result));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}