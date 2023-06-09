import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: XylophonePage(),
        ),
      ),
    );

class XylophonePage extends StatelessWidget {
  const XylophonePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          NoteBar(color: Colors.red, soundIndex: 1),
          NoteBar(color: Colors.orange, soundIndex: 2),
          NoteBar(color: Colors.yellow, soundIndex: 3),
          NoteBar(color: Colors.green, soundIndex: 4),
          NoteBar(color: Colors.teal, soundIndex: 5),
          NoteBar(color: Colors.blue, soundIndex: 6),
          NoteBar(color: Colors.purple, soundIndex: 7),
        ],
      ),
    );
  }
}

class NoteBar extends StatelessWidget {
  final Color color;
  final int soundIndex;

  const NoteBar({super.key, this.color = Colors.red, this.soundIndex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          playSound(soundIndex);
        },
        child: Container(color: color),
      ),
    );
  }
}

void playSound(int noteIndex) {
  final player = AudioPlayer();
  player.audioCache.prefix = '';
  player.play(AssetSource('lib/xylophone/asset/note$noteIndex.wav'));
}
