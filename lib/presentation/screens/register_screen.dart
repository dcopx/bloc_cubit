import 'package:bloc_cubit/presentation/screens/widgets/custom_text_form.dart';
import 'package:bloc_cubit/presentation/state/cubit/register/cubit_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/constant_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => CubitRegister(),
            child: _FormField(),
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatefulWidget {
  @override
  State<_FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<_FormField> {
  final _formKey = GlobalKey<FormState>();
  // String user = '';
  // String email = '';
  // String password = '';

  @override
  Widget build(BuildContext context) {
    final cubitRegister = context.watch<CubitRegister>();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextFormField(
            icon: const Icon(Icons.person_3_outlined),
            label: 'Usuario',
            //onChanged: (value) => user = value,
            onChanged: (value) {
              cubitRegister.onUserChanged(value);
              _formKey.currentState?.validate();
            },
            onValidate: (value) {
              return validarTextField(
                  value: value, isEmpty: false, minLength: 6);
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            icon: const Icon(Icons.mail_outline_outlined),
            label: 'Correo Electrónico',
            //onChanged: (value) => email = value,
            onChanged: (value) {
              cubitRegister.onEmailChanged(value);
              _formKey.currentState?.validate();
            },
            onValidate: (value) {
              return validarTextField(
                  value: value, isEmpty: false, minLength: 6, email: true);
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            icon: const Icon(Icons.lock_outline),
            label: 'Contraseña',
            obscureText: true,
            //onChanged: (value) => password = value,
            onChanged: (value) {
              cubitRegister.onPasswordChanged(value);
              _formKey.currentState?.validate();
            },
            onValidate: (value) {
              return validarTextField(
                  value: value, isEmpty: false, minLength: 6);
            },
          ),
          const SizedBox(height: 10),
          FilledButton.tonalIcon(
            onPressed: () {
              final validacion = _formKey.currentState!.validate();
              if (!validacion) return;
              cubitRegister.onSubmit();
            },
            icon: const Icon(Icons.save_outlined),
            label: const Text('Registrar'),
          )
        ],
      ),
    );
  }
}
