import 'package:flutter/material.dart';

class GreenSquareWidget extends StatefulWidget {
  @override
  GreenSquareWidgetState createState() => GreenSquareWidgetState();
}

class GreenSquareWidgetState extends State<GreenSquareWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _animationController.addListener(() {
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
    double _xRange = MediaQuery.of(context).size.width - 70.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Controller'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 10.0,
                    left: _animationController.value * _xRange + 10.0,
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.green[600],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: const Text('Start'),
                  onPressed: () {
                    _animationController.forward();
                  },
                ),
                RaisedButton(
                  child: const Text('Stop'),
                  onPressed: () {
                    _animationController.stop();
                  },
                ),
                RaisedButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    _animationController.reset();
                  },
                ),
                RaisedButton(
                  child: const Text('Reverse'),
                  onPressed: () {
                    _animationController.reverse();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
