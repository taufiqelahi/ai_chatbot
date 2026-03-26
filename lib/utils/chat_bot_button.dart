// lib/ui/chatbot_button.dart
import 'package:flutter/material.dart';

class ChatBotButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const ChatBotButton({super.key, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: color,
        child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
      ),
    );
  }
}