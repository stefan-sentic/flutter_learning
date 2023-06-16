import 'package:flutter/material.dart';
import 'package:learning/destini/destini.dart';
import 'package:learning/dicee/dicee.dart';
import 'package:learning/home.dart';
import 'package:learning/magic_ball/magic_ball.dart';
import 'package:learning/mi_card/mi_card.dart';
import 'package:learning/quizzler/quizzler.dart';
import 'package:learning/weather/weather.dart';
import 'package:learning/xylophone/xylophone.dart';

import 'bmi_calculator/screen/input_page.dart';
import 'i_am_rich/rich.dart';

final Map<String, Widget Function(BuildContext context)> navigationRoutes = {
  '/home': (context) => const HomeScreen(),
  '/rich': (context) => const ImRichScreen(),
  '/mi_card': (context) => const MiCardScreen(),
  '/dicee': (context) => const DiceeScreen(),
  '/magic_ball': (context) => const MagicBallScreen(),
  '/xylophone': (context) => const XylophoneScreen(),
  '/quizzler': (context) => const QuizzlerScreen(),
  '/destini': (context) => const DestiniScreen(),
  '/bmi_calculator': (context) => const InputPage(),
  '/weather': (context) => const WeatherApp(),
};

void main() => runApp(
      MaterialApp(
        initialRoute: navigationRoutes.keys.first,
        routes: navigationRoutes,
      ),
    );
