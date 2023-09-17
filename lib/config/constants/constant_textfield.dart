String? validarTextField(
    {String? value, bool? isEmpty, int? minLength = 0, bool? email = false}) {
  if (value == null || value.isEmpty || value.trim().isEmpty) {
    return 'Campo Requerido';
  }
  if (value.trim().length < minLength!) return 'Mas de $minLength caracteres';
  if (email!) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'No tiene formato de correo';
    }
  }
  return null;
}
