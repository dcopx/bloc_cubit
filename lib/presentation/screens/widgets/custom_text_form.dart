import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Icon icon;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? onValidate;

  const CustomTextFormField({
    super.key,
    required this.icon,
    this.label,
    this.hint,
    this.errorText,
    this.obscureText = false,
    this.onChanged,
    this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(45));

    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: icon,
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: color.primary)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          label: label != null ? Text(label!) : null,
          hintText: hint,
          errorText: errorText,
          focusColor: color.primary),
      obscureText: obscureText!,
      onChanged: onChanged,
      validator: onValidate,
    );
  }
}
