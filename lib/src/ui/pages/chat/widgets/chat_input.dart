import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatInput extends StatefulWidget {
  final String id;
  const ChatInput(this.id, {super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  late TextEditingController mensajeController;

  void enviar() async {
    String mensaje = mensajeController.text;
    await firestore.collection('mensajes').add({
      'fecha': DateTime.now().toString(),
      'mensaje': mensaje,
      'tipo': 'texto',
      'url_imagen': '',
      'usuario_dest': widget.id,
      'usuario_origen': auth.currentUser!.uid,
    });
  }

  //Metodos de imagen
  File? _image;
  String? url;

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }

    await subirImagen();
  }

  Future<void> subirImagen() async {
    final ref = storage.ref().child('${DateTime.now().toString()}.jpg');
    await ref.putFile(_image!);
    final url = await ref.getDownloadURL();
    await firestore.collection('mensajes').add({
      'fecha': DateTime.now().toString(),
      'mensaje': '',
      'tipo': 'imagen',
      'url_imagen': url,
      'usuario_dest': widget.id,
      'usuario_origen': auth.currentUser!.uid,
    });
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
              _getImage();
            },
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              enviar();
            },
          ),
        ],
      ),
    );
  }
}
