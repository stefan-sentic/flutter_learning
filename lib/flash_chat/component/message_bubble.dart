import 'package:flutter/material.dart';

const double bubbleRadius = 32;

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.sender,
    required this.messageText,
    required this.isMessageOwner,
  });

  final String sender;
  final String messageText;
  final bool isMessageOwner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: isMessageOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              sender,
              style: const TextStyle(color: Colors.black38, fontSize: 12),
            ),
          ),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(isMessageOwner ? 0 : bubbleRadius),
                    topLeft: Radius.circular(isMessageOwner ? bubbleRadius : 0),
                    bottomLeft: const Radius.circular(bubbleRadius),
                    bottomRight: const Radius.circular(bubbleRadius))),
            color: isMessageOwner ? Colors.lightBlue : Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Text(
                messageText,
                style: TextStyle(color: isMessageOwner ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
