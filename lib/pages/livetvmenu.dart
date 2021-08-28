import 'package:flutter/material.dart';
import 'package:movieflix/screens/tvlist.dart';

class TvMenu extends StatelessWidget {
  const TvMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live TV'),
        centerTitle: true,
      ),
      body: TVList(),
    );
  }
}
