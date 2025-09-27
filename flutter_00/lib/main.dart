import 'package:flutter/material.dart';
import 'package:flutter_00/101/container_sized_box_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: ContainerSizedBoxLearn(),
    );
  }
}
