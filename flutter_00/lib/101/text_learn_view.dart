import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key});
  final String name = 'Ahmet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('Test 1: $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                wordSpacing: 2,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                color: Colors.red,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ('Test 2: $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,
            ),
            Text(
              ('Test 3: $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    wordSpacing: 2,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    color: Colors.red,
    letterSpacing: 1,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
