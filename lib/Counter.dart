import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Count: $count');
  }
}

class CounterIncrement extends StatelessWidget {
  CounterIncrement({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

// stateful widget to create widget state
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _descrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CounterIncrement(
          onPressed: _increment,
        ),
        CounterDisplay(
          count: _counter,
        ),
      ],
    );
  }
}
