import 'package:flutter/material.dart';

class BotaoCustomizado extends StatelessWidget {
  //const BotaoCustomizado({Key key}) : super(key: key);

  final String texto;
  final Color corTexto;
  final VoidCallback onPressed;

  BotaoCustomizado({
    @required this.texto,
    this.corTexto = Colors.white,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)
        ),
        primary: const Color(0xff9c27b0),
      ),
    
      child: Text(
        texto,
        style: TextStyle(color:corTexto, fontSize: 20),
      ),
    );
  }
}
