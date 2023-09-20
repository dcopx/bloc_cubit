import 'package:bloc_cubit/structure/inputs/password.dart';
import 'package:bloc_cubit/structure/inputs/username.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../structure/inputs/email.dart';

part 'cubit_register_state.dart';

class CubitRegister extends Cubit<CubitRegisterState> {
  CubitRegister() : super(const CubitRegisterState());

  void onUserChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(user: username, isValid: Formz.validate([username])));
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(email: email, isValid: Formz.validate([email])));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password, isValid: Formz.validate([password])));
  }

  void onSubmit() {
    emit(state.copyWith(
        status: FormStatus.validating,
        user: Username.dirty(state.user.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value)));
    print(state);
  }
}
