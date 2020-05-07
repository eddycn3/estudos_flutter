import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: XylophonePage(),
      ),
    ));

class XylophonePage extends StatelessWidget {
  final player = AudioCache();
  playSound({int numberOfSound}) {
    player.play("note$numberOfSound.wav");
  }

  List<Widget> buildKeys() {
    List<Widget> colorsSounds = List<Widget>();
    const colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.green,
      Colors.pink,
      Colors.teal
    ];

    for (int i = 1; i < 8; i++) {
      colorsSounds.add(Expanded(
        child: FlatButton(
          color: colors[i - 1],
          child: null,
          onPressed: () {
            playSound(numberOfSound: i);
          },
        ),
      ));
    }
    return colorsSounds;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildKeys(),
      ),
    );
  }
}
