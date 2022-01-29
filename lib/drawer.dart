import 'package:flutter/material.dart';
import 'package:scratch_01/scale.dart';

import 'main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
          child: Text('Navigation',
              style: TextStyle(fontSize: 24, color: Colors.white)),
          decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://images.pexels.com/photos/5245865/pexels-photo-5245865.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  ))),
        ),
        ListTile(
          title: const Text('Slider Animation'),
          trailing: const Icon(Icons.art_track),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SliderAnimation();
            }));
          },
        ),
        ListTile(
          title: const Text('Timer Animation'),
          trailing: const Icon(Icons.art_track),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TimerAnimation();
            }));
          },
        ),
      ],
    ));
  }
}
