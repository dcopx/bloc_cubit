part of 'cubit_register.dart';

enum FormStatus { invalid, valid, validating, posting }

class CubitRegisterState extends Equatable {
  final FormStatus status;
  final bool isValid;
  final Username user;
  final Email email;
  final Password password;

  const CubitRegisterState(
      {this.status = FormStatus.invalid,
      this.isValid = false,
      this.user = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  copyWith({
    FormStatus? status,
    bool? isValid,
    Username? user,
    Email? email,
    Password? password,
  }) =>
      CubitRegisterState(
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        user: user ?? this.user,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [status, isValid, user, email, password];
}
