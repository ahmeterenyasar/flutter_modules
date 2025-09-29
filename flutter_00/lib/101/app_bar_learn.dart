import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearn extends StatelessWidget {
  const AppBarLearn({super.key});
  final String _title = 'AppBar Testing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.arrow_back_sharp),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body:
        Center(child: CircularProgressIndicator()),
    );
  }
}
