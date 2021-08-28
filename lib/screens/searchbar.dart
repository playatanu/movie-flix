import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/pages/videoinfo.dart';

class SearchBar extends StatefulWidget {
  SearchBar({required this.search});

  final String search;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('movies')
          .where('searchIndex', arrayContains: widget.search)
          .snapshots(),
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              print(widget.search);
              DocumentSnapshot movie = snapshot.data!.docs[index];

              return SearchItemBuild(movie: movie, name: widget.search);
            });
      },
    );
  }
}

class SearchItemBuild extends StatelessWidget {
  const SearchItemBuild({Key? key, required this.movie, required this.name})
      : super(key: key);

  final DocumentSnapshot<Object?> movie;
  final String name;

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
            child: Column(
              children: [
                Text(name),
                ListTile(
                  leading: Text(
                    movie['movieName'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )));
  }
}
