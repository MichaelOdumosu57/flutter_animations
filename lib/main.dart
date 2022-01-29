import 'package:flutter/material.dart';
import 'package:scratch_01/drawer.dart';

void main() => runApp(MainWidget());

class MainWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliderAnimation(),
    );
  }
}

class SliderAnimation extends StatefulWidget {
  @override
  SliderAnimationState createState() => SliderAnimationState();
}

class SliderAnimationState extends State<SliderAnimation> {
  double _side = 50.0;
  final double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Animation'),
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
            Slider(
              min: 10.0,
              max: 125.0,
              value: _side,
              onChanged: (value) {
                setState(() {
                  _side = value;
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
