import 'package:formz/formz.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');

  const Password.dirty(String value) : super.dirty(value);

  String? get errorMesage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'Campo requerido';
    if (displayError == PasswordError.length) return 'Mínimo 6 caracteres';
    return null;
  }

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.trim().length < 6) return PasswordError.length;
    return null;
  }
}
