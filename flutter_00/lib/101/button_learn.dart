import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: Text('data')),
          ElevatedButton(onPressed: null, child: Text('data')),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded)),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.account_box),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(10),
            ),
            onPressed: () {},
            child: SizedBox(width: 200, child: Text('data')),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.abc),
            label: Text('data'),
          ),
          InkWell(onTap: () {}, child: Text('custom')),
          Container(height: 200, color: Colors.white),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
                right: 40,
                left: 40,
              ),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
