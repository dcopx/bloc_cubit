import 'package:flutter/material.dart';

class BlocScreen extends StatelessWidget {
  static const name = 'bloc-screen';
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(name),
        actions: const [Icon(Icons.replay_outlined)],
      ),
      body: const Center(child: Text('counter: x')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {},
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {},
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {},
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
