import 'package:flutter/material.dart';
// import 'package:flutter_00/101/app_bar_learn.dart';
// Example 1: Simple Counter with Cubit
// import 'package:flutter_00/cubit_learn/counter_cubit.dart';
// import 'package:flutter_00/cubit_learn/counter_page.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// Example 2: Cubit + Dio Exercise (API fetching with state management)
import 'package:flutter_00/cubit_dio_excercise/user_page.dart';

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
      home: const UserPage(),
    );
  }
}
