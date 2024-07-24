part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class IncrementEvent extends CounterEvent {
  int incCount;
  IncrementEvent({required this.incCount});

  @override
  List<Object> get props => [incCount];
}

// ignore: must_be_immutable
class DecrementEvent extends CounterEvent {
  int decCount;
  DecrementEvent({required this.decCount});

  @override
  List<Object> get props => [decCount];
}
