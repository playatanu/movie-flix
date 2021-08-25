import 'package:flutter/material.dart';
import 'package:movieflix/widgets/fullitem.dart';

class FullList extends StatelessWidget {
  const FullList({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Center(child: FullListItem(name: name)),
    );
  }
}
