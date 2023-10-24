import 'package:flutter/material.dart';

void showSnackBar(GlobalKey<ScaffoldMessengerState> key, String message) {
  key.currentState!.showSnackBar(SnackBar(content: Text(message)));
}
