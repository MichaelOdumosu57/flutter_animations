import 'package:flutter/material.dart';

class ColorTweenDemoWidget extends StatefulWidget {
  @override
  ColorTweenDemoWidgetState createState() => ColorTweenDemoWidgetState();
}

class ColorTweenDemoWidgetState extends State<ColorTweenDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late var _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = ColorTween(begin: Colors.red[600], end: Colors.green[600])
        .animate(_animationController);
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Tween Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              width: 50.0,
              color: _animation.value,
            ),
            ElevatedButton(
              child: const Text('Animate!'),
              onPressed: () {
                _animationController.forward();
              },
            )
          ],
        ),
      ),
    );
  }
}
