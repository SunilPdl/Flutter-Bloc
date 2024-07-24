part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int count;
  CounterState({required this.count});
  @override
  List<Object> get props => [count];
}
