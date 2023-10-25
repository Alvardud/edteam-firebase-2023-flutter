import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2023_edteam/src/core/models/mensaje.dart';
import 'package:firebase_2023_edteam/src/ui/pages/chat/widgets/chat_input.dart';
import 'package:firebase_2023_edteam/src/ui/pages/chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> chatKey = GlobalKey<ScaffoldMessengerState>();

class ChatPage extends StatefulWidget {
  final String id;
  static const route = 'chat_page';
  const ChatPage(this.id, {super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final firestore = FirebaseFirestore.instance;
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
                child: FutureBuilder(
              future: firestore
                  .collection('mensajes')
                  .where('usuario_dest', isEqualTo: widget.id)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final mensajes_firebase = snapshot.data!.docs as List;
                  return ListView.builder(
                    itemCount: mensajes_firebase.length,
                    itemBuilder: (context, index) {
                      final Mensaje mensaje = Mensaje.fromSnapshot(
                          mensajes_firebase[index].data(),
                          mensajes_firebase[index].id);
                      return MessageBubble(
                        isImage: mensaje.tipo == 'imagen',
                        message: mensaje.tipo == 'imagen'
                            ? mensaje.urlImagen!
                            : mensaje.mensaje!,
                        isSent: index % 2 == 0,
                      );
                      ;
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            )),
            ChatInput(widget.id),
          ],
        ),
      ),
    );
  }
}
