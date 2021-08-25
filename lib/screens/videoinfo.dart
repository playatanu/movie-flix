import 'package:flutter/material.dart';
import 'package:movieflix/screens/videoplayer.dart';
import 'package:movieflix/widgets/hvideo.dart';

import 'allmovie.dart';

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
          maxChildSize: 0.7,
          initialChildSize: 0.3,
          builder: (BuildContext context, ScrollController scrollController) {
            return ListView(controller: scrollController, children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
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
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'New Movie',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AllMovie()));
                                          },
                                          child: Text(
                                            'View All',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  movieList(),
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

/*
Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
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
                           padding: const EdgeInsets.all(35),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
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
                    
                             ]
                    
                          ) ),
]



*/
/*
Container(
                decoration: BoxDecoration(
                    color: Color(0xFF151026),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    )),
                child: GestureDetector(
                    onTap: ()       {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayer(
                                    videourl: widget.videourl,
                                  )));
                    },
                    child: Hero(
                      tag: 'playvideo',
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              padding: const EdgeInsets.all(35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  )
                                  DraggableScrollableSheet(builder: (context,controler){

                                                 return Container();

                                  }
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),*/