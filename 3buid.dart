import 'package:flutter/material.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI with MediaQuery',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Responsive UI Example")),
        body: const ResponsiveLayout(),
      ),
    );
  }
}


class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return _buildMobileLayout();
    } else if (screenWidth < 1200) {
      return _buildTabletLayout();
    } else {
      return _buildDesktopLayout();
    }
  }
  Widget _buildMobileLayout() {
    return Container(
      color: Colors.blue.shade50,
      child: const Center(
        child: Text(
          " Mobile Layout",
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
      ),
    );
    }


  // Tablet layout
  Widget _buildTabletLayout() {
    return Container(
      color: Colors.green.shade50,
      child: const Center(
        child: Text(
          " Tablet Layout",
          style: TextStyle(fontSize: 28, color: Colors.green),
        ),
      ),
    );
  }


  // Desktop layout
  Widget _buildDesktopLayout() {
    return Container(
      color: Colors.red.shade50,
      child: const Center(
        child: Text(
          " Desktop Layout",
          style: TextStyle(fontSize: 32, color: Colors.red),
        ),
      ),
    );
  }
}
