import 'package:chat_app/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/custome_input.dart';
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
              onPressed: () {
                print(emailCtrl.text);
                print(passwordCtrl.text);
              }),
        ],
      ),
    );
  }
}
