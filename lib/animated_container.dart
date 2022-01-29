import 'dart:async';

import 'package:flutter/material.dart';

class ContainerAnimation extends StatefulWidget {
  @override
  ContainerAnimationState createState() => ContainerAnimationState();
}

class ContainerAnimationState extends State<ContainerAnimation> {
  var _side = 50.0;
  var _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Animation'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: AnimatedContainer(
                      height: _side,
                      width: _side,
                      color: Color.fromRGBO(0, 128, 0, _opacity),
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceOut,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text("Scale & Fade"),
              onPressed: () {
                setState(() {
                  _side = 125.0;
                  // _opacity = 0.0;
                });
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
