import 'package:flutter/material.dart';
import '../components/player.dart';

void main() {
  runApp(Meditaion());
}

class Meditaion extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Meditaion")),
      ),
      body: Player(),
    );
  }
}
