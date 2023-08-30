import 'package:bloc_cubit/presentation/state/cubit/cubit_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  static const name = 'cubit-screen';
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubitCounter(),
      child: const _CubitScreen(name: name),
    );
  }
}

class _CubitScreen extends StatelessWidget {
  final String name;
  const _CubitScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final cubitState = context.select((CubitCounter value) => value.state);
    final cubitUpdateCounter = context.read<CubitCounter>();

    return Scaffold(
      appBar: AppBar(
        title: Text('$name: ${cubitState.transacCount}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () => cubitUpdateCounter.reset(),
          )
        ],
      ),
      body: Center(child: Text('counter: ${cubitState.counter}')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              cubitUpdateCounter.increaseBy(3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              cubitUpdateCounter.increaseBy(2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              cubitUpdateCounter.increaseBy(1);
            },
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
