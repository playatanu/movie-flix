import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieflix/screens/videoinfo.dart';

// ignore: camel_case_types
class movieList extends StatelessWidget {
  const movieList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('movies').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              //itemCount: 5,
              itemBuilder: (context, index) {
                DocumentSnapshot movie = snapshot.data!.docs[index];

                return itemBuild(movie: movie);
              });
        },
      ),
    );
  }
}

class itemBuild extends StatelessWidget {
  const itemBuild({
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
          width: 130,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                    movie['movieImage'],
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie['movieName'],
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class movieList2 extends StatelessWidget {
  const movieList2({required this.indexq});

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
class seriesBanner extends StatelessWidget {
  const seriesBanner({required this.indexq});

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

                return seriesBanneritemBuild(movie: movie);
              });
        },
      ),
    );
  }
}

class seriesBanneritemBuild extends StatelessWidget {
  const seriesBanneritemBuild({
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
