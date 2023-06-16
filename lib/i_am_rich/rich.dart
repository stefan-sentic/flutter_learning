import 'package:flutter/material.dart';

class ImRichScreen extends StatelessWidget {
  const ImRichScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("I Am Rich"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: const Center(
        child: Image(
          image: AssetImage('lib/i_am_rich/diamond.png'),
        ),
      ),
    );
  }
}
