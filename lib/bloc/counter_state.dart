part of 'counter_bloc.dart';

class CounterState
    extends Union3Impl<CounterInitial, CounterIncrementing, CounterValue> {
  static const unions =
      Triplet<CounterInitial, CounterIncrementing, CounterValue>();
  CounterState._(
      Union3<CounterInitial, CounterIncrementing, CounterValue> union)
      : super(union);

  factory CounterState.initial() =>
      CounterState._(unions.first(CounterInitial()));

  factory CounterState.incrementing() =>
      CounterState._(unions.second(CounterIncrementing()));

  factory CounterState.value(int value) =>
      CounterState._(unions.third(CounterValue(value)));
}

class CounterInitial {}

class CounterIncrementing {}

class CounterValue {
  final int value;

  CounterValue(this.value);
}
