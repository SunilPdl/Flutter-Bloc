import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState(count: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterIncrementState(incCount: event.incCount + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterDecrementState(decCount: event.decCount - 1));
    });
  }
}
