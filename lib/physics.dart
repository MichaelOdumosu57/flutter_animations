import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';



class PhysicsWidget extends StatefulWidget {
  @override
  PhysicsWidgetState createState() => PhysicsWidgetState();
}

class PhysicsWidgetState extends State<PhysicsWidget>
    with SingleTickerProviderStateMixin {
  var _offset = 50.0;

  bool _animationDone = false;

  late AnimationController _animationController;
  late GravitySimulation _gravitySimulation;
  late FrictionSimulation _frictionSimulation;
  late SpringSimulation _springSimulation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController.unbounded(
      vsync: this,
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _animationDone = true;
        });
      }
    });

    _gravitySimulation = GravitySimulation(
      700.0,
      -65.0,
      410.0,
      0.0,
    );

    // _frictionSimulation = FrictionSimulation(
    //   0.5,
    //   -65.0,
    //   100.0,
    // );

    _frictionSimulation = FrictionSimulation.through(
      -65.0,
      410.0,
      500.0,
      25.0,
    );

    SpringDescription springDescription = const SpringDescription(
      mass: 1.0,
      stiffness: 100.0,
      damping: 5.0,
    );

    _springSimulation = SpringSimulation(
      springDescription,
      -65.0,
      410.0,
      250.0,
    );

    _animationController.animateWith(_springSimulation);
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
        title: const Text('Physics'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: _offset,
            left: _offset,
            child: Visibility(
              visible: _animationDone,
              child: Image(
                image: const AssetImage('images/carved-rock-logo-bug.png'),
                height: MediaQuery.of(context).size.width - (_offset * 2),
                width: MediaQuery.of(context).size.width - (_offset * 2),
              ),
            ),
          ),
          Positioned(
            top: _animationController.value,
            left: _offset / 2,
            child: ElevatedButton(
              child: const Text('Log in!'),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: _animationController.value,
            right: _offset / 2,
            child: ElevatedButton(
              child: const Text('Sign up!'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
