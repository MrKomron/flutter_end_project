import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  Widget build(BuildContext buildContext) => MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: TabBarView(
              children: [
                VideoWidget(),
                Container(
                  child: Center(
                    child: Text('This is the second tab'),
                  ),
                ),
              ],
            ),
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.video_library)),
                  Tab(icon: Icon(Icons.description)),
                ],
              ),
              title: Text("Video afspelen"),
            ),
          ),
        ),
      );
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget>
    with AutomaticKeepAliveClientMixin<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/hospital.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        if (_isPlaying) _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
