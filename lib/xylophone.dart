import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class XylophonePage extends StatelessWidget {
  void playSound(int number) {
    final player = AudioCache();
    player.play("note$number.wav");
  }

  Widget buildKey(int number) {
    return FlatButton(
      onPressed: () {
        playSound(number);
      },
      child: Text("Click Me $number"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildKey(1),
        buildKey(2),
        buildKey(3),
        buildKey(4),
        buildKey(5),
        buildKey(6),
        buildKey(7),
      ],
    );
  }
}
