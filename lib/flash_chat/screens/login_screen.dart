import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/flash_chat/constants.dart';
import 'package:learning/flash_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../component/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: tagImageLogo,
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset(imgLogo),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              PrimaryButton(
                  text: 'Log In',
                  color: Colors.lightBlueAccent,
                  onClick: () async {
                    await loginUser(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      setState(() {
        showSpinner = true;
      });
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const ChatScreen();
        }));
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase auth exception: ${e.code}');
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }
}
