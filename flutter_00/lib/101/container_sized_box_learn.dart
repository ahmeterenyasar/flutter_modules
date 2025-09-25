import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget{
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 500,
            child: Text('data' * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(dimension: 50,
          child: Text('X' * 50),)
        ],
      ),
    );
  }
  
}
