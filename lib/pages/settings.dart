import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  Widget build(BuildContext buildContext) => MaterialApp(
    home: Scaffold(
      body: AppTree(),
      appBar: AppBar(title: Text("Titel van de app"),),
    ),
  );
}

class AppTree extends StatelessWidget {
  final AudioPlayer audioSpeler = AudioPlayer();

  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () { audioSpeler.play(AssetSource('audio/holiday-yuriybespalov.mp3'), volume: 1); },
            child: Text('Speel muziek', textScaleFactor: 2)
        )
    );
  }
}