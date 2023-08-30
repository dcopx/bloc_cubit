part of 'cubit_counter.dart';

class CubitCounterState extends Equatable {
  final int counter;
  final int transacCount;

  const CubitCounterState({required this.counter, required this.transacCount});

  copyWith({int? counter, int? transacCount}) => CubitCounterState(
      counter: counter ?? this.counter,
      transacCount: transacCount ?? this.transacCount);

  @override
  List<Object> get props => [(counter, transacCount)];
}
