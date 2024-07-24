part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class CounterInitialState extends CounterState {
  int count;
  CounterInitialState({required this.count});
  @override
  List<Object> get props => [count];
}

// ignore: must_be_immutable
final class CounterIncrementState extends CounterState {
  int incCount;
  CounterIncrementState({required this.incCount});
  @override
  List<Object> get props => [incCount];
}

// ignore: must_be_immutable
final class CounterDecrementState extends CounterState {
  int decCount;
  CounterDecrementState({required this.decCount});
  @override
  List<Object> get props => [decCount];
}
