part of 'counter_bloc.dart';

class CounterState extends Union4Impl<CounterInitial, CounterIncrementing,
    CounterValue, CounterDecrementing> {
  static const unions = Quartet<CounterInitial, CounterIncrementing,
      CounterValue, CounterDecrementing>();
  CounterState._(
      Union4<CounterInitial, CounterIncrementing, CounterValue,
              CounterDecrementing>
          union)
      : super(union);

  factory CounterState.initial() =>
      CounterState._(unions.first(CounterInitial()));

  factory CounterState.incrementing() =>
      CounterState._(unions.second(CounterIncrementing()));

  factory CounterState.value(int value) =>
      CounterState._(unions.third(CounterValue(value)));

  factory CounterState.decrementing() =>
      CounterState._(unions.fourth(CounterDecrementing()));
}

class CounterInitial {}

class CounterIncrementing {}

class CounterValue {
  final int value;

  CounterValue(this.value);
}

class CounterDecrementing {}
