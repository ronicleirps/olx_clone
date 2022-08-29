import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:olx_clone/models/usuario.dart';
import 'package:olx_clone/view/inputCustomizado.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
  }

  bool _cadastrar = false;
  String _mensagemErro = '';

  String _textoBotao = 'Entrar';

  TextEditingController _controllerEmail =
      TextEditingController(text: "ronclei@gmail.com");
  TextEditingController _controllerSenha =
      TextEditingController(text: "876134");

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

  _cadastrarUsuario(Usuario usuario) {
    //Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      print('cadastrado');
      // redireciona para tela principal
    });
  }

  _logarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) => {

          print("LOGADO")
              // redireciona para tela principal
            });
  }

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
                            _textoBotao = "Entrar";
                            if (_cadastrar) {
                              _textoBotao = "Cadastrar";
                            }
                          });
                        }),
                        const Text("Cadastrar"),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    _validarCampos();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff9c27b0),
                  ),
                  child: Text(
                    _textoBotao,
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
