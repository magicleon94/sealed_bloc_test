import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_bloc_test/bloc/counter_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Sealed bloc test'),
          ),
          body: SealedBlocBuilder3<CounterBloc, CounterState, CounterInitial,
              CounterIncrementing, CounterValue>(
            builder: (context, states) => states(
              (initial) => Center(child: Text('Initial')),
              (incrementing) => Center(child: Text('Incrementing')),
              (value) => Center(child: Text('${value.value}')),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => BlocProvider.of<CounterBloc>(context).add(
              CounterEvent.increment(),
            ),
          ),
        ),
      ),
    );
  }
}
