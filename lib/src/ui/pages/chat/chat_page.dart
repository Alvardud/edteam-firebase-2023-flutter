import 'package:firebase_2023_edteam/src/ui/pages/chat/widgets/chat_input.dart';
import 'package:firebase_2023_edteam/src/ui/pages/chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> chatKey = GlobalKey<ScaffoldMessengerState>();

class ChatPage extends StatefulWidget {
  static const route = 'chat_page';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> chatMessages = [
    'Hola, ¿cómo estás?',
    '¡Hola! Estoy bien, ¿y tú?',
    'Estoy genial, gracias.',
    '¿Qué has estado haciendo?',
    'No mucho, solo trabajando en algunos proyectos.',
    '¡Eso suena genial!',
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: chatKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat de Ejemplo'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    message: chatMessages[index],
                    isSent: index % 2 == 0,
                  );
                },
              ),
            ),
            const ChatInput(),
          ],
        ),
      ),
    );
  }
}
