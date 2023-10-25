import 'package:firebase_2023_edteam/src/core/models/usuario.dart';
import 'package:firebase_2023_edteam/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:firebase_2023_edteam/src/ui/pages/login/login_page.dart';
import 'package:firebase_2023_edteam/src/ui/pages/register/register_page.dart';
import 'package:firebase_2023_edteam/src/ui/widgets/common/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<bool> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      showSnackBar(loginKey, 'Ocurrio un error ${e.toString()}');
      return false;
    }
  }

  void register(Usuario usuario, String email, String password) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firestore.collection('usuarios').doc(response.user!.uid).set({
        'apellidos': usuario.apellidos,
        'nombre': usuario.nombre,
        'edad': usuario.edad,
        'profesion': usuario.profesion
      });
      await response.user!.sendEmailVerification();
    } catch (e) {
      showSnackBar(registerKey, 'Ocurrio un error ${e.toString()}');
    }
  }

  void rememberPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      showSnackBar(rememberKey, 'Se envio el correo correctamente');
    } catch (e) {
      showSnackBar(rememberKey, 'Ocurrio un error ${e.toString()}');
    }
  }
}
