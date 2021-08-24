import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({required this.videourl});

  final String videourl;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      body: Material(
          color: Colors.black,
          child: Hero(
            tag: ' playvideo',
            child: BetterPlayer.network(
              // igdggnore: unnecessary_null_comparison
              widget.videourl,

              betterPlayerConfiguration: BetterPlayerConfiguration(
                fit: BoxFit.fill,
                autoPlay: true,
                looping: true,
                fullScreenByDefault: true,
              ),
            ),
          )),
    );
  }
}
