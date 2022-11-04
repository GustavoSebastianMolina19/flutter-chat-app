import 'package:chat_app/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/custome_input.dart';
import '../widgets/custome_label.dart';
import '../widgets/logo.dart';

class RegisterPage extends StatelessWidget {
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
                  titulo: 'Registro',
                ),
                _Form(),
                Labels(
                  ruta: 'login',
                  titulo: '¿Ya tienes cuenta?',
                  subtitulo: 'Iniciar Sesión con cuenta',
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
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomeInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            controller: nameCtrl,
          ),
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
