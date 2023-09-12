import 'package:bloc_cubit/presentation/screens/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: _FormField()),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const CustomTextFormField(
          icon: Icon(Icons.person_3_outlined),
          label: 'Usuario',
        ),
        const SizedBox(height: 10),
        const CustomTextFormField(
          icon: Icon(Icons.mail_outline_outlined),
          label: 'Correo Electrónico',
        ),
        const SizedBox(height: 10),
        const CustomTextFormField(
          icon: Icon(Icons.lock_outline),
          label: 'Contraseña',
          obscureText: true,
        ),
        const SizedBox(height: 10),
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: const Icon(Icons.save_outlined),
          label: const Text('Registrar'),
        )
      ],
    );
  }
}
