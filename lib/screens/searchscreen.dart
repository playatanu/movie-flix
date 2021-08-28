import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/pages/videoinfo.dart';
import 'package:movieflix/widgets/deadertext.dart';

import 'hitsmovie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  bool issearch = false;
  String searchName = '';
  TextEditingController _searchcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchcontroller.addListener(_onSearchChanged);
  }

  _onSearchChanged() {
    print(_searchcontroller.text);
    searchName = _searchcontroller.text;
  }

  @override
  void dispose() {
    _searchcontroller.removeListener(_onSearchChanged);
    _searchcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !issearch
              ? Text('MovieFlix')
              : TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                  ),
                  controller: _searchcontroller,
                ),
          centerTitle: true,
          actions: [
            !issearch
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        //this.issearch = !this.issearch;
                        (issearch == true)
                            ? searchName = _searchcontroller.text
                            : this.issearch = !this.issearch;
                      });
                    },
                    icon: Icon(Icons.search))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        (issearch == true)
                            ? searchName = _searchcontroller.text
                            : this.issearch = !this.issearch;
                      });
                    },
                    icon: Icon(
                      Icons.search,
                    )),
          ],
          leading: !issearch
              ? Text('')
              : IconButton(
                  onPressed: () {
                    setState(() {
                      (issearch == true)
                          ? this.issearch = !this.issearch
                          : this.issearch = !this.issearch;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  )),
        ),
        body: searchName == ''
            ? Center(
                child: (Text(
                  'Search Movies Clicking the Search Icon',
                  style: TextStyle(color: Colors.white),
                )),
              )
            : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('movies')
                    .where('searchIndex', arrayContains: searchName)
                    .snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        print(searchName);
                        DocumentSnapshot movie = snapshot.data!.docs[index];

                        return SearchItemBuild(movie: movie, name: searchName);
                      });
                },
              ));
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
          child: ListTile(
            title: Text(
              movie['movieName'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: Image.network(movie['movieImage']),
          ),
        ));
  }
}
