import 'package:flutter/material.dart';

class CustomeInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomeInput({
    super.key,
    required this.icon,
    required this.placeHolder,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        autocorrect: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeHolder),
      ),
    );
  }
}
