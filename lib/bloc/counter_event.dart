part of 'counter_bloc.dart';

class CounterEvent extends Union2Impl<IncrementCounter, DecrementCounter> {
  static const unions = Doublet<IncrementCounter, DecrementCounter>();

  CounterEvent._(Union2<IncrementCounter, DecrementCounter> union)
      : super(union);

  factory CounterEvent.increment() =>
      CounterEvent._(unions.first(IncrementCounter()));
  factory CounterEvent.decrement() =>
      CounterEvent._(unions.second(DecrementCounter()));
}

class IncrementCounter {}

class DecrementCounter {}
