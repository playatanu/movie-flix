import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/screens/tvlist.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: BetterPlayer.network(
                widget.videourl,
                betterPlayerConfiguration: BetterPlayerConfiguration(
                  //aspectRatio: 1,
                  looping: true,
                  autoPlay: true,
                  fit: BoxFit.fill,
                  fullScreenAspectRatio: 1,
                  autoDetectFullscreenDeviceOrientation: true,
                  autoDispose: true,
                  fullScreenByDefault: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
