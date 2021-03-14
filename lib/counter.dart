import 'package:bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);
  final String title;
  final CounterBloc bloc;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder(
        stream: widget.bloc.counter,
        initialData: 0,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Counter: '), Text('${snapshot.data}')],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.bloc.counterEventSink.add(StateEvent.increment),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
