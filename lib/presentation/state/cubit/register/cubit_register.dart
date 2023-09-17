import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit_register_state.dart';

class CubitRegister extends Cubit<CubitRegisterState> {
  CubitRegister() : super(const CubitRegisterState());

  void onUserChanged(String value) {
    emit(state.copyWith(user: value));
  }

  void onEmailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void onSubmit() {
    print(state);
  }
}
