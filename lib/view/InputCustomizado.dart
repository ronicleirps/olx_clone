import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final bool autofocus;
  final TextInputType type;

  const InputCustomizado(
      {Key key,
      @required this.controller,
      @required this.hint,
      this.obscure = false,
      this.autofocus,
      this.type = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      autofocus: true,
      keyboardType: type,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
    );
  }
}
