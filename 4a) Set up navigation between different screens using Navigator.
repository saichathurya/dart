import 'package:flutter/material.dart';


void main() {
  runApp(NavigationDemoApp());
}


class NavigationDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Named Routes Demo',
      initialRoute: '/',   // default route
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Screen'),
          onPressed: () {
            // Navigate to second screen using route name
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back to Home'),
          onPressed: () {
            // Go back to previous screen
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}


