import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Color bubbleClr;
  const ChatBubble({super.key, required this.message, required this.bubbleClr});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: bubbleClr),
      child: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
