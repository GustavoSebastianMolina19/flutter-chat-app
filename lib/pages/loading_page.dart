import 'package:chat_app/pages/login_pages.dart';
import 'package:chat_app/pages/usuarios_pages.dart';
import 'package:chat_app/services/auth_services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/socket_services.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(child: Text('Esperen...'));
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authServices = Provider.of<AuthServices>(context, listen: false);
    final socketServices = Provider.of<SocketServices>(context, listen: false);
    final autenticado = await authServices.isLoggin();
    if (autenticado) {
      //Navigator.pushReplacementNamed(context, 'usuarios');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => UsuariosPage(),
            transitionDuration: Duration(
              milliseconds: 4000,
            )),
      );
      socketServices.conectar();
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginPage(),
            transitionDuration: const Duration(
              milliseconds: 1000,
            )),
      );
    }
  }
}
