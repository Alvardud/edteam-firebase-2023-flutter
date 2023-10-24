import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const route = 'forgot_password_page';
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para enviar un correo de restablecimiento de contraseña
                },
                child: const Text('Enviar Correo de Restablecimiento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
