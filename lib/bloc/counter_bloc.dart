import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial());
  var counter = 0;

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield* event.join(
      _increment,
      () async* {
        yield CounterState.initial();
      },
    );
  }

  Stream<CounterState> _increment(IncrementCounter event) async* {
    yield CounterState.incrementing();
    await Future.delayed(Duration(seconds: 1));
    counter++;
    yield CounterState.value(counter);
  }
}
