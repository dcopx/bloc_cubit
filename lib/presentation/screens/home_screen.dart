import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Cubit'),
              onTap: () => context.push('/cubit-screen'),
            ),
            ListTile(
              title: const Text('BLoC'),
              onTap: () => context.push('/bloc-screen'),
            ),
            ListTile(
              title: const Text('Registro'),
              onTap: () => context.push('/register-screen'),
            )
          ],
        ),
      ),
    );
  }
}
