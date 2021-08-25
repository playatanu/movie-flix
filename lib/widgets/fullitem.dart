import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/pages/videoinfo.dart';

class FullListItem extends StatefulWidget {
  FullListItem({required this.name});

  final String name;

  @override
  _FullListItemState createState() => _FullListItemState();
}

class _FullListItemState extends State<FullListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(widget.name).snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot movie = snapshot.data!.docs[index];

                return FullListItemBuild(movie: movie);
              });
        },
      ),
    );
  }
}

// ignore: camel_case_types
class FullListItemBuild extends StatelessWidget {
  const FullListItemBuild({
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie['movieName'],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
