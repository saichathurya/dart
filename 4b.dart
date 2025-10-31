import 'package:flutter/material.dart';


void main() {
  runApp(NamedRoutesApp());
}


class NamedRoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      debugShowCheckedModeBanner: false,


      // First page that opens
      initialRoute: '/',


      // Define the routes
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to Second Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Go to Third Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Second Screen'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Go to Third Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Back to Home'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Third Screen'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Back to Home'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
