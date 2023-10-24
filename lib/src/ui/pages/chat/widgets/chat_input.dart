import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  late TextEditingController mensajeController;

  void enviar() async {
    String mensaje = mensajeController.text;
  }

  @override
  void initState() {
    mensajeController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: mensajeController,
              decoration: const InputDecoration(
                hintText: 'Escribe un mensaje...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () {
              // Agrega la lógica para enviar el mensaje
            },
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Agrega la lógica para enviar el mensaje
            },
          ),
        ],
      ),
    );
  }
}