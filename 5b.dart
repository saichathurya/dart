import 'package:flutter/material.dart';
void main() {
  runApp(SetStateDemoApp());
}
class SetStateDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'setState Demo',
      home: SetStateCounterScreen(),
    );
  }
}

class SetStateCounterScreen extends StatefulWidget {
  @override
  _SetStateCounterScreenState createState() => _SetStateCounterScreenState();
}

class _SetStateCounterScreenState extends State<SetStateCounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++; // update state
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setState Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter value: $_counter', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
