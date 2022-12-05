import 'dart:io';

class Enviormenents {
  static String apiUrl = Platform.isAndroid
      ? 'http://192.168.0.13:3000/api/'
      : 'http://localhost:3000/api/';
  static String socketUrl =
      Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';
}
