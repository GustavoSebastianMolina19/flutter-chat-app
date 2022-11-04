import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const BotonAzul({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        elevation: 2, backgroundColor: Colors.blue, shape: StadiumBorder());
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
