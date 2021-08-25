import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/screens/movies.dart';
import 'package:movieflix/screens/serise.dart';
import 'package:movieflix/widgets/deadertext.dart';
import 'package:movieflix/widgets/slider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0x44000000),
        elevation: 0,
        //backgroundColor: Colors.black,
        title: Text('MovieFlix'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CrouselSlider(),
            HeaderText(section: 'New Movie'),
            MovieList(),
            HeaderText(section: 'Web Series'),
            SeriesList(),
          ],
        ),
      ),
    );
  }
}
