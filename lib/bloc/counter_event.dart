part of 'counter_bloc.dart';

class CounterEvent extends Union1Impl<IncrementCounter> {
  static const unions = Singlet<IncrementCounter>();

  CounterEvent._(Union1<IncrementCounter> union) : super(union);

  factory CounterEvent.increment() =>
      CounterEvent._(unions.first(IncrementCounter()));
}

class IncrementCounter {}
