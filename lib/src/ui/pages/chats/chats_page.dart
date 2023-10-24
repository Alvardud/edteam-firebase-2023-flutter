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
              child: ListView.builder(
                itemCount: filteredChats.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatPage())),
                    title: Text(filteredChats[index]),
                    // Aquí puedes agregar la navegación al chat seleccionado
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
