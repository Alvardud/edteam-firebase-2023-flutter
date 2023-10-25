import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isImage;
  final bool isSent;

  const MessageBubble(
      {super.key,
      required this.message,
      required this.isSent,
      this.isImage = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSent ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isImage
            ? SizedBox(child: Image.network(message), width: 100, height: 100)
            : Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
      ),
    );
  }
