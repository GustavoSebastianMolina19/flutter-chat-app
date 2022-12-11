import 'package:chat_app/helpers/mostrar_alerta.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/socket_services.dart';
import 'package:chat_app/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/custome_input.dart';
import 'package:provider/provider.dart';
import '../widgets/custome_label.dart';
import '../widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(
                  titulo: 'Messenger',
                ),
                _Form(),
                Labels(
                  ruta: 'register',
                  titulo: 'No tienes Cuenta?',
                  subtitulo: 'Crear una cuenta ahora!',
                ),
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    final socketServices = Provider.of<SocketServices>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomeInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            controller: emailCtrl,
          ),
          CustomeInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            controller: passwordCtrl,
            isPassword: true,
          ),
          BotonAzul(
              buttonText: 'Ingrese',
              onPressed: authServices.autenticando
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final loginOk = await authServices.login(
                          emailCtrl.text.trim(), passwordCtrl.text.trim());

                      if (loginOk) {
                        Navigator.pushReplacementNamed(context, 'usuarios');
                        socketServices.conectar();
                      } else {
                        //Navegar alerta
                        mostraAlerta(context, 'Login incorrecto',
                            'Revice las credenciales');
                      }
                    }),
        ],
      ),
    );
  }
}
