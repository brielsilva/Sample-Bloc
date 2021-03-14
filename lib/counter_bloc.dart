import 'dart:async';

import 'package:bloc/myCounter.dart';

enum StateEvent { increment, decrement }

class CounterBloc {
  int _counter = 0;

  final StreamController<int> counterState = StreamController<int>();

  Stream<int> get counter => counterState.stream;

  StreamSink<int> get counterSink => counterState.sink;

  final counterController = StreamController<StateEvent>();

  Stream<StateEvent> get counterEvent => counterController.stream;

  Sink<StateEvent> get counterEventSink => counterController.sink;

  CounterBloc() {
    counterController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(StateEvent event) {
    if (event == StateEvent.increment) {
      _counter++;
    } else
      _counter--;

    counterSink.add(_counter);
  }

  void dispose() {
  }
}
