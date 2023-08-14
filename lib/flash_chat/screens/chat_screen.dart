import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/flash_chat/message.dart';

import '../component/message_bubble.dart';
import '../constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final messageController = TextEditingController();
  String sender = "";
  String messageText = "";

  @override
  void initState() {
    super.initState();
    sender = _auth.currentUser?.email ?? 'Unknown email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                await _auth.signOut();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firestore.collection('message').snapshots(),
              builder: (context, asyncSnapshot) {
                return buildMessageList(asyncSnapshot);
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('message').add({
                        'text': messageText,
                        'sender': sender,
                        'date': DateTime.now().millisecondsSinceEpoch,
                      });
                      messageController.clear();
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageList(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> asyncSnapshot) {
    List<MessageBubble> messageWidgets = [];

    if (!asyncSnapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.lightBlueAccent,
        ),
      );
    }

    final messagesMap = asyncSnapshot.data!.docs.reversed;
    final messages = messagesMap
        .map((e) => Message(text: e.data()['text'], sender: e.data()['sender'], date: e.data()['date']))
        .toList();
    messages.sort((m1, m2) => m1.date - m2.date);

    for (var message in messages) {
      messageWidgets.add(
        MessageBubble(
          sender: message.sender,
          messageText: message.text,
          isMessageOwner: _auth.currentUser?.email == sender,
        ),
      );
    }

    return Expanded(
      child: ListView(
        children: messageWidgets,
      ),
    );
  }
}
