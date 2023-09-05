import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocCounter extends Bloc<BlocEvent, BlocState> {
  BlocCounter() : super(BlocState()) {
    on<BlocEventIncrease>(_onIncrease);
    on<BlocEventReset>(_onReset);
  }

  void _onIncrease(BlocEventIncrease event, Emitter<BlocState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      tranCount: state.tranCount + 1,
    ));
  }

  void _onReset(BlocEventReset event, Emitter<BlocState> emit) {
    emit(state.copyWith(
      counter: 0,
      tranCount: 0,
    ));
  }
}
