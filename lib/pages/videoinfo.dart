import 'package:flutter/material.dart';
import 'package:movieflix/pages/videoplayer.dart';
import 'package:movieflix/screens/movies.dart';
import 'package:movieflix/screens/serise.dart';
import 'package:movieflix/widgets/deadertext.dart';

class VideoInfo extends StatefulWidget {
  VideoInfo(
      {required this.moviename,
      required this.imageurl,
      required this.videourl});

  final String imageurl;
  final String moviename;
  final String videourl;

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text(widget.moviename),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.imageurl), fit: BoxFit.cover)),
        child: DraggableScrollableSheet(
          minChildSize: 0.3,
          maxChildSize: 1.0,
          initialChildSize: 0.3,
          builder: (BuildContext context, ScrollController scrollController) {
            return ListView(controller: scrollController, children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF151026),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        )),
                    child: GestureDetector(
                        child: Column(children: [
                          Divider(
                            height: 50,
                            thickness: 3,
                            indent: 150,
                            endIndent: 150,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              widget.moviename,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'PLAY',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 52,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.play_circle_fill,
                                          color: Colors.white,
                                          size: 80,
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  HeaderText(
                                    section: 'New Movie',
                                    db: 'movies',
                                  ),
                                  MovieList(),
                                  HeaderText(
                                    section: 'Web Series',
                                    db: 'webseries',
                                  ),
                                  SeriesList(),
                                ],
                              )),
                        ]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayer(
                                        videourl: widget.videourl,
                                      )));
                        })),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
