import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_lumut/controller/controller_todos.dart';
import 'package:test_lumut/screens/detail/detail.dart';
import 'package:test_lumut/screens/master/master.dart';

class Rotation extends StatefulWidget {
  const Rotation({Key? key}) : super(key: key);

  @override
  _RotationState createState() => _RotationState();
}

class _RotationState extends State<Rotation> {
  ControllerTodos controllerTodos = Get.put(ControllerTodos());
  @override
  void initState() {
    super.initState();
    controllerTodos.getListTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const Master(isPotrait: true);
        } else {
          return const LandsCape();
        }
      }),
    );
  }
}

class LandsCape extends StatefulWidget {
  const LandsCape({Key? key}) : super(key: key);

  @override
  _LandsCapeState createState() => _LandsCapeState();
}

class _LandsCapeState extends State<LandsCape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: const [
        Flexible(
          child: Master(isPotrait: false),
        ),
        Flexible(
          child: Detail(),
        )
      ],
    ));
  }
}
