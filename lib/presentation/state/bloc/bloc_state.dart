part of 'bloc_counter.dart';

class BlocState extends Equatable {
  final int counter;
  final int tranCount;

  BlocState({this.counter = 10, this.tranCount = 0});

  @override
  List<Object> get props => [counter, tranCount];

  BlocState copyWith({int? counter, int? tranCount}) => BlocState(
        counter: counter ?? this.counter,
        tranCount: tranCount ?? this.tranCount,
      );
}
