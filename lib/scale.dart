import 'dart:async';

import 'package:flutter/material.dart';

import 'drawer.dart';

class TimerAnimation extends StatefulWidget {
  @override
  TimerAnimationState createState() => TimerAnimationState();
}

class TimerAnimationState extends State<TimerAnimation> {
  double _side = 50.0;
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Animation'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 50.0,
                    left: MediaQuery.of(context).size.width / 2 - (_side / 2),
                    child: Container(
                      height: _side,
                      width: _side,
                      color: Color.fromRGBO(0, 128, 0, _opacity),
                    ),
                  ),
                ],
              ),
            ),
            Text(_side.toStringAsFixed(0)),
            ElevatedButton(
              child: const Text("Scale"),
              onPressed: () {
                Timer.periodic(const Duration(milliseconds: 10), (timer) {
                  setState(() {
                    _side += 1;
                    _opacity = 1.0 - ((_side - 50.0) / 1000);
                  });
                  if (_side >= 150) timer.cancel();
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
