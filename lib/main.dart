import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_bloc_test/bloc/counter_bloc.dart';

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
          body: BlocBuilder<CounterBloc, CounterState>(
            //just to show how
            buildWhen: (previous, current) => current.join(
              (_) => true,
              (_) => true,
              (_) => true,
              (_) => true,
            ),
            builder: (context, state) => state.join(
              (initial) => Center(child: Text('Initial')),
              (incrementing) => Center(child: Text('Incrementing')),
              (decrementing) => Center(child: Text('Decrementing')),
              (value) => Center(child: Text('${value.value}')),
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => BlocProvider.of<CounterBloc>(context)
                    .add(IncrementCounter()),
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () => BlocProvider.of<CounterBloc>(context)
                    .add(DecrementCounter()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
