import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 25)),
              ),
              child: Text('Cancel'),
            ),

          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.star),
            label: Text('Favorite'),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              textStyle: WidgetStatePropertyAll(
                TextStyle(
                  fontSize: 25,
                  foreground: Paint()..color = Colors.black,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.access_alarm),
            iconSize: 50,
          ),
          FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            child: Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red, width: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Outlined Button'),
          ),
          // InkWell(),
        ],
      ),
    );
  }
}
