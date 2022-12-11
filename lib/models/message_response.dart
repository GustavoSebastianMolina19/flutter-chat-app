// To parse this JSON data, do
//
//     final mensajesResponse = mensajesResponseFromJson(jsonString);

import 'dart:convert';

MensajesResponse mensajesResponseFromJson(String str) =>
    MensajesResponse.fromJson(json.decode(str));

String mensajesResponseToJson(MensajesResponse data) =>
    json.encode(data.toJson());

class MensajesResponse {
  MensajesResponse({
    this.ok,
    this.miId,
    this.mensajeDe,
    required this.last40,
  });

  bool? ok;
  String? miId;
  String? mensajeDe;
  List<Last40> last40;

  factory MensajesResponse.fromJson(Map<String, dynamic> json) =>
      MensajesResponse(
        ok: json["ok"],
        miId: json["miId"],
        mensajeDe: json["mensajeDe"],
        last40:
            List<Last40>.from(json["last40"].map((x) => Last40.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "miId": miId,
        "mensajeDe": mensajeDe,
        "last40": List<dynamic>.from(last40.map((x) => x.toJson())),
      };
}

class Last40 {
  Last40({
    this.de,
    this.para,
    this.mensaje,
    required this.createdAt,
    required this.updatedAt,
  });

  String? de;
  String? para;
  String? mensaje;
  DateTime createdAt;
  DateTime updatedAt;

  factory Last40.fromJson(Map<String, dynamic> json) => Last40(
        de: json["de"],
        para: json["para"],
        mensaje: json["mensaje"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "de": de,
        "para": para,
        "mensaje": mensaje,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
