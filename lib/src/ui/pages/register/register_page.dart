import 'package:firebase_2023_edteam/src/core/models/usuario.dart';
import 'package:firebase_2023_edteam/src/core/service/auth.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> registerKey =
    GlobalKey<ScaffoldMessengerState>();

class RegistrationPage extends StatefulWidget {
  static const route = 'register_page';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController nombreController;
  late TextEditingController apellidoController;
  late TextEditingController edadController;
  late TextEditingController profesionController;
  late TextEditingController correoController;
  late TextEditingController contrasenaController;

  final auth = Auth();

  void registrar() async {
    String correo = correoController.text;
    String contrasena = contrasenaController.text;
    String nombre = nombreController.text;
    String apellidos = apellidoController.text;
    int edad = int.parse(edadController.text);
    String profesion = profesionController.text;

    auth.register(
        Usuario('',
            nombre: nombre,
            apellidos: apellidos,
            edad: edad,
            profesion: profesion),
        correo,
        contrasena);
  }

  @override
  void initState() {
    nombreController = TextEditingController(text: '');
    apellidoController = TextEditingController(text: '');
    edadController = TextEditingController(text: '');
    profesionController = TextEditingController(text: '');
    correoController = TextEditingController(text: '');
    contrasenaController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: registerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registro de Usuario'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                      labelText: 'Nombres',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: apellidoController,
                    decoration: const InputDecoration(
                      labelText: 'Apellidos',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: correoController,
                    decoration: const InputDecoration(
                      labelText: 'Correo Electrónico',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: contrasenaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: edadController,
                    decoration: const InputDecoration(
                      labelText: 'Edad',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: profesionController,
                    decoration: const InputDecoration(
                      labelText: 'Profesión',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: registrar,
                    child: const Text('Registrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
