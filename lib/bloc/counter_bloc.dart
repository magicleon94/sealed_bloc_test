import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sealed_unions/sealed_unions.dart';
import 'package:sealed_unions/union_4.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial());
  var counter = 0;
  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementCounter) {
      yield* _increment(event);
    } else if (event is DecrementCounter) {
      yield* _decrement(event);
    }
  }

  Stream<CounterState> _increment(IncrementCounter event) async* {
    yield CounterState.incrementing();
    await Future.delayed(Duration(seconds: 1));
    counter++;
    yield CounterState.value(counter);
  }

  Stream<CounterState> _decrement(DecrementCounter event) async* {
    yield CounterState.decrementing();
    await Future.delayed(Duration(milliseconds: 500));
    counter--;
    yield CounterState.value(counter);
  }
}
