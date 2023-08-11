import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learning/flash_chat/component/primary_button.dart';
import 'package:learning/flash_chat/screens/login_screen.dart';
import 'package:learning/flash_chat/screens/registration_screen.dart';

import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: tagImageLogo,
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset(imgLogo),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',
                        textStyle: const TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            PrimaryButton(
                text: 'Log In',
                color: Colors.lightBlueAccent,
                onClick: () {
                  if (context.mounted) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  }
                }),
            PrimaryButton(
                text: 'Register',
                color: Colors.blueAccent,
                onClick: () {
                  if (context.mounted) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const RegistrationScreen();
                    }));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
