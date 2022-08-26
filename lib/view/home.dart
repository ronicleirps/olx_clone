import 'package:flutter/material.dart';
import 'package:olx_clone/models/Usuario.dart';
import 'package:olx_clone/view/inputCustomizado.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _cadastrar = false;
  String _mensagemErro = '';

    

  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty && senha.length > 6) {
        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;

        if (_cadastrar) {
          _cadastrarUsuario(usuario);
        } else {
          _logarUsuario(usuario);
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha a senha ! Digite mais de 6 caracteres";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o Email valido";
      });
    }
  }

  _cadastrarUsuario(Usuario usuario) {}

  _logarUsuario(Usuario usuario) {}

  TextEditingController _controllerEmail =
      TextEditingController(text: "ronclei@gmail.com");
  TextEditingController _controllerSenha =
      TextEditingController(text: "111111");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "imagens/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                InputCustomizado(
                  controller: _controllerEmail,
                  hint: 'Email',
                  autofocus: true,
                  type: TextInputType.emailAddress,
                ),
                InputCustomizado(
                  controller: _controllerSenha,
                  hint: 'Senha',
                  obscure: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Logar"),
                    Switch(
                        activeColor: const Color(0xff9c27b0),
                        value: _cadastrar,
                        onChanged: (bool valor) {
                          setState(() {
                            _cadastrar = valor;
                          });
                        })
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff9c27b0),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    _mensagemErro,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
