import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/pages/videoinfo.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('movies')
            .where('tag', isEqualTo: 'movie')
            //.orderBy('movieNumber', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              // itemCount: 5,
              itemBuilder: (context, index) {
                DocumentSnapshot movie = snapshot.data!.docs[index];

                return itemBuild(movie: movie);
              });
        },
      ),
    );
  }
}

// ignore: camel_case_types
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
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
