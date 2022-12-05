import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/loading_page.dart';
import 'package:chat_app/pages/login_pages.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/usuarios_pages.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoute = {
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
  'loading': (_) => const LoadingPage(),
  'register': (_) => RegisterPage(),
  'usuarios': (_) => UsuariosPage(),
};
