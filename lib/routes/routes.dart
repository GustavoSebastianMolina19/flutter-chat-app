import 'package:chat_app/pages/login_pages.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoute = {
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
};
