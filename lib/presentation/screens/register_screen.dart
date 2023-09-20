import 'package:bloc_cubit/presentation/screens/widgets/custom_text_form.dart';
import 'package:bloc_cubit/presentation/state/cubit/register/cubit_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class _FormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubitRegister = context.watch<CubitRegister>();
    final username = cubitRegister.state.user;
    final password = cubitRegister.state.password;
    final email = cubitRegister.state.email;
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextFormField(
              icon: const Icon(Icons.person_3_outlined),
              label: 'Usuario',
              //onChanged: (value) => user = value,
              onChanged: cubitRegister.onUserChanged,
              errorText: username.errorMesage),
          const SizedBox(height: 10),
          CustomTextFormField(
              icon: const Icon(Icons.mail_outline_outlined),
              label: 'Correo Electrónico',
              //onChanged: (value) => email = value,
              onChanged: cubitRegister.onEmailChanged,
              errorText: email.errorMesage),
          const SizedBox(height: 10),
          CustomTextFormField(
              icon: const Icon(Icons.lock_outline),
              label: 'Contraseña',
              obscureText: true,
              //onChanged: (value) => password = value,
              onChanged: cubitRegister.onPasswordChanged,
              errorText: password.errorMesage),
          const SizedBox(height: 10),
          FilledButton.tonalIcon(
            onPressed: () {
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
