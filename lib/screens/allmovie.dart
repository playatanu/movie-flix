import 'package:flutter/material.dart';
import 'package:movieflix/widgets/hvideo.dart';

class AllMovie extends StatefulWidget {
  AllMovie({Key? key}) : super(key: key);

  @override
  _AllMovieState createState() => _AllMovieState();
}

class _AllMovieState extends State<AllMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Movies'),
      ),
      body: Container(
        child: movieList(),
      ),
    );
  }
}
