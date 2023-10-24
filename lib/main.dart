import 'package:firebase_2023_edteam/src/ui/pages/chat/chat_page.dart';
import 'package:firebase_2023_edteam/src/ui/pages/chats/chats_page.dart';
import 'package:firebase_2023_edteam/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:firebase_2023_edteam/src/ui/pages/login/login_page.dart';
import 'package:firebase_2023_edteam/src/ui/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi chat app',
      routes: {
        LoginPage.route: (context) => const LoginPage(),
        RegistrationPage.route: (context) => const RegistrationPage(),
        ForgotPasswordPage.route: (context) => const ForgotPasswordPage(),
        ChatListPage.route: (context) => const ChatListPage(),
        ChatPage.route: (context)=> const ChatPage()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.route,
    );
  }
}
