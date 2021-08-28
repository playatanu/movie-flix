import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/pages/videoinfo.dart';
import 'package:movieflix/pages/videoplayer.dart';

class TVList extends StatelessWidget {
  const TVList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tv').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot tv = snapshot.data!.docs[index];

                return itemBuild(tv: tv);
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
    required this.tv,
  }) : super(key: key);

  final DocumentSnapshot<Object?> tv;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayer(
                      videourl: tv['tvUrl'],
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
                    tv['tvImage'],
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tv['tvName'],
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
