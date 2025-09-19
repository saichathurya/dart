import 'package:flutter/material.dart';

void main() {
  runApp(StateDemoApp());
}

class StateDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful & Stateless Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful & Stateless Widgets'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stateless widget example
            MyStatelessWidget(),

            SizedBox(height: 40),

            // Stateful widget example
            MyStatefulWidget(),
          ],
        ),
      ),
    );
  }
}

// Stateless widget: does NOT hold state
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'I am a Stateless Widget',
        style: TextStyle(fontSize: 24, color: Colors.blue),
      ),
    );
  }
}

// Stateful widget: holds state (counter in this example)
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++; // updates the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'I am a Stateful Widget',
            style: TextStyle(fontSize: 24, color: Colors.green),
          ),
          SizedBox(height: 16),
          Text(
            'Counter: $_counter',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Increment Counter'),
          ),
        ],
      ),
    );
  }
}
