import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning/flash_chat/screens/welcome_screen.dart';

class FlashChatApp extends StatefulWidget {
  const FlashChatApp({super.key});

  @override
  State<FlashChatApp> createState() => _FlashChatAppState();
}

class _FlashChatAppState extends State<FlashChatApp> {

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}
