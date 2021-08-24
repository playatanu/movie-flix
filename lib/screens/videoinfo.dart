import 'package:flutter/material.dart';
import 'package:movieflix/screens/videoplayer.dart';

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
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text(widget.moviename),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoPlayer(
                                videourl: widget.videourl,
                              )));
                },
                child: Row(
                  children: [
                    Text('PLAY'),
                    SizedBox(
                      width: 05,
                    ),
                    Icon(Icons.play_circle_fill_outlined)
                  ],
                )),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.imageurl), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(flex: 2, child: Container(decoration: BoxDecoration())),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF151026),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    )),
                child: GestureDetector(
                    onTap: () {
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
