import 'package:bloc_cubit/presentation/state/bloc/bloc_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  static const name = 'bloc-screen';
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlocCounter(),
      child: const BlocScreenView(name: name),
    );
  }
}

class BlocScreenView extends StatelessWidget {
  final String name;

  const BlocScreenView({
    super.key,
    required this.name,
  });

  void _onIncreaseBy(BuildContext context, [int value = 1]) {
    context.read<BlocCounter>().add(BlocEventIncrease(value));
  }

  void _onReset(BuildContext context) {
    context.read<BlocCounter>().add(const BlocEventReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((BlocCounter blocCounter) =>
            Text('$name : ${blocCounter.state.tranCount}')),
        actions: [
          IconButton(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () {
              _onReset(context);
            },
          )
        ],
      ),
      body: Center(
        child: context.select((BlocCounter blocCounter) =>
            Text('counter: ${blocCounter.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 3,
            onPressed: () => _onIncreaseBy(context, 3),
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () => _onIncreaseBy(context, 2),
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 1,
            onPressed: () => _onIncreaseBy(context, 1),
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
