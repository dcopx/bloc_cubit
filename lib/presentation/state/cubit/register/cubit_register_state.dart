part of 'cubit_register.dart';

enum FormStatus { invalid, valid, validating, posting }

class CubitRegisterState extends Equatable {
  final FormStatus status;
  final String user;
  final String email;
  final String password;

  const CubitRegisterState(
      {this.status = FormStatus.invalid,
      this.user = '',
      this.email = '',
      this.password = ''});

  copyWith({
    FormStatus? status,
    String? user,
    String? email,
    String? password,
  }) =>
      CubitRegisterState(
        status: status ?? this.status,
        user: user ?? this.user,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [status, user, email, password];
}
