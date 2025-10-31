import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(home: AnimationDemo(), debugShowCheckedModeBanner: false);
}


class AnimationDemo extends StatefulWidget {
  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}


class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale, fade;
  late Animation<Offset> slide;


  @override
  void initState() {
    super.initState();


    // Controller (2s, repeats back and forth)
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);


    // Different types of animations
    scale = Tween(
      begin: 0.5,
      end: 1.5,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));


    fade = Tween(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));


    slide = Tween(
      begin: Offset(0, -0.3),
      end: Offset(0, 0.3),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  Widget buildBox(Color color, String text) => Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Different Animations")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ScaleTransition(scale: scale, child: buildBox(Colors.blue, "Scale")),
          FadeTransition(opacity: fade, child: buildBox(Colors.green, "Fade")),
          SlideTransition(
            position: slide,
            child: buildBox(Colors.orange, "Slide"),
          ),
        ],
      ),
    ),
  );
}
