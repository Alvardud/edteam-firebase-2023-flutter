import 'package:firebase_2023_edteam/src/core/service/auth.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> rememberKey =
    GlobalKey<ScaffoldMessengerState>();

class ForgotPasswordPage extends StatefulWidget {
  static const route = 'forgot_password_page';
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController correoController;

  final auth = Auth();

  void enviar() async {
    String correo = correoController.text;
    auth.rememberPassword(correo);
  }

  @override
  void initState() {
    correoController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: rememberKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Olvidé mi Contraseña'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Por favor, ingrese su dirección de correo electrónico para restablecer su contraseña.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electrónico',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: enviar,
                  child: const Text('Enviar Correo de Restablecimiento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
