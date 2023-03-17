import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  Widget build(BuildContext buildContext) => MaterialApp(
    home: Scaffold(
      body: AppTree(),
      appBar: AppBar(title: Text("Video afspelen"),),
    ),
  );
}

class AppTree extends StatefulWidget{
  _AppTreeState createState() => _AppTreeState();
}

class _AppTreeState extends State<AppTree> {
  VideoPlayerController videoController = VideoPlayerController.asset("assets/videos/hospital.mp4");

  void initState() {
    videoController.setLooping(true);
    videoController.initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    bool isVisible = true;

    return ListView(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 640 / 360,  // breedte gedeeld door hoogte
              child: VideoPlayer(videoController)
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                videoController.value.isPlaying ? videoController.pause() : videoController.play();
              });
            },
            child: videoController.value.isPlaying ? Icon(Icons.pause, size: 60) : Icon(Icons.play_arrow, size: 60),
          ),
        ]
    );
  }
}





class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key,}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/hospital.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          VideoPlayer(_controller),
          VideoProgressIndicator(_controller, allowScrubbing: true),
        ],
      ),
    );
  }
}
