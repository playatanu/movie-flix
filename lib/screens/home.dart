import 'package:flutter/material.dart';
import 'package:movieflix/screens/movies.dart';
import 'package:movieflix/screens/serise.dart';
import 'package:movieflix/widgets/deadertext.dart';
import 'package:movieflix/widgets/slider.dart';
import 'hitsmovie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieFlix'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CrouselSlider(),
            HeaderText(section: 'New Movie', db: 'movies'),
            MovieList(),
            HeaderText(section: 'Hit Movies', db: 'hitmovies'),
            HitMovieList(),
            HeaderText(section: 'Web Series', db: 'webseries'),
            SeriesList(),
            // NewList(),
          ],
        ),
      ),
    );
  }
}
