part of 'bloc_counter.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class BlocEventIncrease extends BlocEvent {
  final int value;
  const BlocEventIncrease(this.value);
}

class BlocEventReset extends BlocEvent {
  const BlocEventReset();
}
