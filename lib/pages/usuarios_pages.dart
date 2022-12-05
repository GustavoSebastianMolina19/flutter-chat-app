import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(uid: '1', nombre: 'Maria', email: "tests@test.com", online: true),
    Usuario(
        uid: '2', nombre: 'Melissa', email: "tests2@test.com", online: true),
    Usuario(
        uid: '3', nombre: 'Fernando', email: "tests3@test.com", online: false),
  ];

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    final usuario = authServices.usuario;
    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nombre ?? '',
            style: TextStyle(color: Colors.grey[300])),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            //TODO: Desconectar del socketServer
            AuthServices.deleteToken();
            Navigator.pushReplacementNamed(context, 'login');
          },
          icon: Icon(Icons.exit_to_app, color: Colors.grey[300]),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.blue[400],
          ),
          waterDropColor: Colors.blue[400]!,
        ),
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]!),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre!),
      leading: CircleAvatar(
        child: Text(usuario.nombre!.substring(0, 2)),
        backgroundColor: Colors.blue[600],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online! ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}
