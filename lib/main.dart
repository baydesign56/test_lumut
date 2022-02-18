import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_lumut/screens/master/master.dart';
import 'package:test_lumut/screens/rotation/rotation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'test_lumut',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Rotation());
  }
}
