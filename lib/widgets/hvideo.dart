import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieflix/pages/videoinfo.dart';



// ignore: camel_case_types
class MovieList2 extends StatelessWidget {
  const MovieList2({required this.indexq});

  final int indexq;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('movies').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                DocumentSnapshot movie = snapshot.data!.docs[indexq];

                return itemBuild2(movie: movie);
              });
        },
      ),
    );
  }
}

// ignore: camel_case_types
class itemBuild2 extends StatelessWidget {
  const itemBuild2({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final DocumentSnapshot<Object?> movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoInfo(
                      imageurl: movie['movieImage'],
                      videourl: movie['videoUrl'],
                      moviename: movie['movieName'],
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //margin: EdgeInsets.symmetric(vertical: 20.0),

          alignment: Alignment.bottomLeft,
          /* width: 300,
          height: 300,*/
          height: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                    movie['movieCover'],
                  ),
                  fit: BoxFit.cover)),
          child: null,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class SeriesBanner extends StatelessWidget {
  const SeriesBanner({required this.indexq});

  final int indexq;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('webseries').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                DocumentSnapshot movie = snapshot.data!.docs[indexq];

                return SeriesBanneritemBuild(movie: movie);
              });
        },
      ),
    );
  }
}

// ignore: camel_case_types
class SeriesBanneritemBuild extends StatelessWidget {
  const SeriesBanneritemBuild({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final DocumentSnapshot<Object?> movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoInfo(
                      imageurl: movie['movieImage'],
                      videourl: movie['videoUrl'],
                      moviename: movie['movieName'],
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //margin: EdgeInsets.symmetric(vertical: 20.0),

          alignment: Alignment.bottomLeft,
          /* width: 300,
          height: 300,*/
          height: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                    movie['movieCover'],
                  ),
                  fit: BoxFit.cover)),
          child: null,
        ),
      ),
    );
  }
}
