import 'dart:math';

import 'package:flutter/material.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const MagicBall(),
    );
  }
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  var _ballIndex = 1;

  void setNextBallImage() {
    setState(() {
      _ballIndex = Random().nextInt(5) + 1;
    });
  }

  @override
  void initState() {
    setNextBallImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () {
            setNextBallImage();
          },
          child: Image.asset('lib/magic_ball/image/ball$_ballIndex.png')),
    );
  }
}
