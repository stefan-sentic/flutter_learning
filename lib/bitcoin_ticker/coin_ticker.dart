import 'package:flutter/material.dart';

import 'screen/loading_screen.dart';

class CoinTickerApp extends StatelessWidget {
  const CoinTickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: const LoaderScreen(),
    );
  }
}
