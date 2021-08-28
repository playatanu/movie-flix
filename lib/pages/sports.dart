import 'package:flutter/material.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sports'),
          centerTitle: true,
        ),
        body: Center(
            child: Text(
          'This feature coming soon!',
          style: TextStyle(color: Colors.white),
        )));
  }
}
