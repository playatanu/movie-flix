import 'package:flutter/material.dart';
import 'package:movieflix/screens/movies.dart';
import 'package:movieflix/screens/serise.dart';
import 'package:movieflix/widgets/deadertext.dart';
import 'package:movieflix/widgets/slider.dart';
import 'hitsmovie.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
