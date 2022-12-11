import 'dart:convert';

import 'package:chat_app/global/enviorements.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices with ChangeNotifier {
  late Usuario usuario;
  bool _autenticando = false;

  final _storage = const FlutterSecureStorage();

  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  //Getter static token
  static Future<String> getToken() async {
    const _storage = FlutterSecureStorage();

    final token = await _storage.read(key: 'token');

    return (token != null) ? token : '';
  }

  static Future<void> deleteToken() async {
    const _storage = FlutterSecureStorage();

    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;

    final data = {
      'email': email,
      'password': password,
    };
    final response = await http.post(
      Uri.parse('${Enviormenents.apiUrl}login'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    autenticando = false;

    if (response.statusCode == 200) {
      final logResponse = loginResponseFromJson(response.body);
      usuario = logResponse.usuario!;

      // TODO: Guardar token
      await _saveToken(logResponse.token!);
      return true;
    } else {
      return false;
    }
  }

  Future register(String name, String email, String password) async {
    autenticando = true;

    final data = {
      'nombre': name,
      'email': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse('${Enviormenents.apiUrl}login/new'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    autenticando = false;

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario!;

      await _saveToken(loginResponse.token!);

      return true;
    } else {
      final respBody = jsonDecode(response.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggin() async {
    var token = await _storage.read(key: 'token');
    token = token ?? '';
    final resp = await http
        .get(Uri.parse('${Enviormenents.apiUrl}login/renew'), headers: {
      'Content-Type': 'application/json',
      'x-token': token,
    });

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario!;
      await _saveToken(loginResponse.token!);

      return true;
    } else {
      logout();
      return false;
    }
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
