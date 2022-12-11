import 'package:chat_app/global/enviorements.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketServices with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket? _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket? get socket => _socket;
  Function? get emit => _socket?.emit;

  void conectar() async {
    final token = await AuthServices.getToken();

    _socket = IO.io(
        Enviormenents.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .enableAutoConnect() // disable auto-connection
            .enableForceNew()
            .setExtraHeaders({'x-token': token})
            .build());

    _socket?.onConnect((_) {
      print('connect');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
      //socket.emit('msg', 'test');
    });

    _socket?.onDisconnect((_) {
      print('disconnect');
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    /*socket.on('nuevo-mensaje', (payload) {
      print('nuevoMensaje: $payload');
    });*/

    _socket?.on('fromServer', (_) => print(_));
  }

  void desconectar() {
    _socket?.disconnect();
  }
}
