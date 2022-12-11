import 'package:http/http.dart' as http;

import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/models/usuarios_response.dart';
import 'package:chat_app/services/auth_services.dart';
import '../global/enviorements.dart';

class UsuariosServices {
  Future<List<Usuario>> getUsuario() async {
    try {
      final resp = await http.get(
        Uri.parse('${Enviormenents.apiUrl}usuarios'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthServices.getToken(),
        },
      );

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios ?? [];
    } catch (e) {
      return [];
    }
  }
}
