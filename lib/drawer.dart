import 'package:flutter/material.dart';
import 'package:scratch_01/scale.dart';

import 'animated_container.dart';
import 'green_scale_widget.dart';
import 'main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListTile> links = List.generate(4, (int idx) {
      String title = [
        'Slider Animation',
        'Timer Animation',
        'Container Animation',
        'Animated Container'
      ][idx];
      StatefulWidget Function() navWidget = [
        () => SliderAnimation(),
        () => TimerAnimation(),
        () => ContainerAnimation(),
        () => GreenSquareWidget()
      ][idx];
      return ListTile(
        title: Text(title),
        trailing: const Icon(Icons.art_track),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return navWidget();
          }));
        },
      );
    });

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
        ...links
      ],
    ));
  }
}
