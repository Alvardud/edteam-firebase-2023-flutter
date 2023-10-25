import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2023_edteam/src/core/models/usuario.dart';
import 'package:firebase_2023_edteam/src/ui/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> chatListKey =
    GlobalKey<ScaffoldMessengerState>();

class ChatListPage extends StatefulWidget {
  static const route = 'chats_page';

  const ChatListPage({super.key});
  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final firestore = FirebaseFirestore.instance;

  List<String> chats = [
    'Chat 1',
    'Chat 2',
    'Chat 3',
    'Chat 4',
    'Chat 5',
    'Chat 6',
    'Chat 7',
  ];

  List<String> filteredChats = [];

  @override
  void initState() {
    super.initState();
    filteredChats = chats;
  }

  void filterChats(String query) {
    setState(() {
      filteredChats = chats
          .where((chat) => chat.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: chatListKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Chats'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: filterChats,
                decoration: const InputDecoration(
                  labelText: 'Buscar Chats',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: firestore.collection('usuarios').get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final usuarios_firebase = snapshot.data!.docs as List;
                  return ListView.builder(
                    itemCount: usuarios_firebase.length,
                    itemBuilder: (context, index) {
                      log(usuarios_firebase[index].data().toString());
                      final Usuario usuario = Usuario.fromSnapshot(
                          usuarios_firebase[index].data(), usuarios_firebase[index].id);
                      return ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(usuarios_firebase[index].id))),
                        title: Text(usuario.nombre ?? ''),
                        // Aquí puedes agregar la navegación al chat seleccionado
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
