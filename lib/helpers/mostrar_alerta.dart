import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostraAlerta(BuildContext context, String titulo, String subtitulo) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            elevation: 5,
            textColor: Colors.blue,
            child: const Text('ok'),
          )
        ],
      ),
    );
  }

  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ),
  );
}
