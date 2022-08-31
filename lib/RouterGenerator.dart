import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx_clone/view/anuncios.dart';
import 'package:olx_clone/view/login.dart';
import 'package:olx_clone/view/meusAnuncios.dart';
import 'package:olx_clone/view/novoAnuncio.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const Anuncios());
      case "/login":
        return MaterialPageRoute(builder: (_) => const Login());
      case "/meus-anuncios":
        return MaterialPageRoute(builder: (_) => const MeusAnuncios());
        case "/novo-anuncio":
        return MaterialPageRoute(builder: (_) => const NovoAnuncio());
      
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {

      return MaterialPageRoute(builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text("Tela não encontrada!"),
          
          ),
          body: Center(child: Text("Tela não encontrada!"),) ,
        );
      });

  }
}
