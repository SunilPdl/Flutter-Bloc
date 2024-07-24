import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0));

  void IncrementEvent() => emit(CounterState(count: state.count + 1));

  void DecrementEvent() => emit(CounterState(count: state.count - 1));
}
