import 'package:flutter/material.dart';
import 'package:learning/bmi_calculator/constant.dart';
import 'package:learning/bmi_calculator/screen/input_page.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData.dark()
            .copyWith(primaryColor: primaryColor, scaffoldBackgroundColor: primaryColor),
        home: const InputPage(),
      ),
    );
