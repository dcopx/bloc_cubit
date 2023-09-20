import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  static final RegExp emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  const Email.pure() : super.pure('');

  const Email.dirty(String value) : super.dirty(value);

  String? get errorMesage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'Campo requerido';
    if (displayError == EmailError.format) {
      return 'No tiene el formato de correo electrónico';
    }
    return null;
  }

  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (!emailExp.hasMatch(value)) return EmailError.format;
    return null;
  }
}
