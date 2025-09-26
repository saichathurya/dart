import 'package:flutter/material.dart';
void main() {
  runApp(CustomWidgetDemoApp());
}
class CustomWidgetDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widgets Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Widgets Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Using custom widget
              MyCustomCard(
                title: 'Card 1',
                description: 'This is the first custom card.',
                icon: Icons.favorite,
                color: Colors.pinkAccent,
              ),
              SizedBox(height: 16),
              MyCustomCard(
                title: 'Card 2',
                description: 'This is another custom card.',
                icon: Icons.star,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Custom Widget: MyCustomCard
class MyCustomCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;


  // Constructor with named parameters
  const MyCustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 48, color: color),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(description, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
