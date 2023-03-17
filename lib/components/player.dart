import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'track.dart';

class Player extends StatefulWidget {
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final AudioPlayer audioSpeler = AudioPlayer();
  List<Track> tracks = <Track>[];
  Duration _duration = new Duration();
  Duration _position = new Duration();

  @override
  void initState() {
    add("Meditation 1",  "Nature, Rain", "music1");
    add("Meditation 2",  "Birds, Nature", "music2");
    add("Meditation 3",   "Water, Birds, Thunder, Frogs", "music3");
    audioSpeler.onPositionChanged.listen((position) => setState(() {
      _position = position;
    }));
    audioSpeler.onDurationChanged.listen((duration) => setState(() {
      _duration = duration;
    }));
    super.initState();
  }

  void add(String title,String album, String filename) {
    Track track = Track(title,   album, filename);
    track.setArtworkByFile("assets/images/" + filename + ".jpg");
    track.setFile("musics/" + filename + ".mp3");
    tracks.add(track);
  }

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      maakTrackRij(tracks[0]),
      maakTrackRij(tracks[1]),
      maakTrackRij(tracks[2]),
    ]);
  }

  Widget maakTrackRij(Track track) {
    return Dismissible(
      key: ObjectKey(track),
      background: Container(color: Colors.red),
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
        padding: const EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
              child: Row(children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 70,
                    child: Column(children: [
                      Expanded(
                          child: Container(
                              child: RichText(
                                  textScaleFactor: 1.2,
                                  text: TextSpan(
                                    text: track.title,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),

                                  )))),
                      Expanded(
                          child: Container(
                              child: RichText(
                                text: TextSpan(text: track.album, style: TextStyle(color: Colors.grey, fontSize: 16)),
                              ))),

                    ]),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: track.artwork,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (!track.hasStarted) {
                            stopAll();
                          }
                          if (track.isPlaying) {
                            audioSpeler.pause();
                            track.pause();
                          } else {
                            if (!track.hasStarted) {
                              audioSpeler.play(AssetSource(track.file!));
                              Timer.periodic(Duration(seconds: 1), (mijnTimer) {
                                if (_position.inSeconds==_duration.inSeconds) {
                                  mijnTimer.cancel();
                                  setState(() {
                                    stopAll();
                                  });
                                }
                              });
                            } else {
                              audioSpeler.resume();
                            }
                            track.play();
                          }
                        });
                      },
                      icon: track.isPlaying ?
                      Icon(Icons.pause, size: 40) :
                      (track.hasStarted ? Icon(Icons.play_arrow, size: 40) : Icon(Icons.play_arrow, size: 40)),
                    ),
                  ),
                )
              ]),
            ),
            Container(
              height: track.hasStarted ? 7 : 1,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[300]!))),
              child: LinearProgressIndicator(
                  value: track.hasStarted && _duration.inSeconds.toDouble()>0 ? _position.inSeconds.toDouble()/_duration.inSeconds.toDouble() : 0,
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  void stopAll() {
    audioSpeler.stop();
    tracks.forEach((t) { t.stop(); });
  }
}