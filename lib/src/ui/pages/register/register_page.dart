import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> registerKey =
    GlobalKey<ScaffoldMessengerState>();

class RegistrationPage extends StatelessWidget {
  static const route = 'register_page';
  const RegistrationPage({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombres',
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Apellidos',
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Edad',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Profesión',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para registrar al usuario
                  },
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
