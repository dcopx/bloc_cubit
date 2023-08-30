import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit_counter_state.dart';

class CubitCounter extends Cubit<CubitCounterState> {
  CubitCounter() : super(const CubitCounterState(counter: 5, transacCount: 0));

  void increaseBy(int increase) {
    emit(state.copyWith(
      counter: state.counter + increase,
      transacCount: state.transacCount + 1,
    ));
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
      transacCount: state.transacCount + 1,
    ));
  }
}
