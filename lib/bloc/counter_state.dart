part of 'counter_bloc.dart';

class CounterState extends Union4Impl<CounterInitial, CounterIncrementing,
    CounterDecrementing, CounterValue> {
  static const _unions = Quartet<CounterInitial, CounterIncrementing,
      CounterDecrementing, CounterValue>();

  CounterState._(
      Union4<CounterInitial, CounterIncrementing, CounterDecrementing,
              CounterValue>
          union)
      : super(union);

  factory CounterState.initial() =>
      CounterState._(_unions.first(CounterInitial()));

  factory CounterState.incrementing() =>
      CounterState._(_unions.second(CounterIncrementing()));

  factory CounterState.decrementing() =>
      CounterState._(_unions.third(CounterDecrementing()));

  factory CounterState.value(int value) =>
      CounterState._(_unions.fourth(CounterValue(value)));
}

class CounterInitial {}

class CounterIncrementing {}

class CounterDecrementing {}

class CounterValue {
  final int value;
  CounterValue(this.value);
}
