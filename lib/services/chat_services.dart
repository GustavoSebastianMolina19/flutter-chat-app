import 'package:chat_app/models/message_response.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:chat_app/models/usuario.dart';

import 'package:chat_app/global/enviorements.dart';

class ChatServices with ChangeNotifier {
  late Usuario usuarioTo;

  Future<List<Last40>> getChat(String usuarioID) async {
    final resp = await http
        .get(Uri.parse('${Enviormenents.apiUrl}mensajes/$usuarioID'), headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthServices.getToken(),
    });

    final mensajesResponse = mensajesResponseFromJson(resp.body);

    return mensajesResponse.last40;
  }
}
