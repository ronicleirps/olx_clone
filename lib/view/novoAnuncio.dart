import 'package:flutter/material.dart';
import 'package:olx_clone/view/widgets/botaoCustomizado.dart';

class NovoAnuncio extends StatefulWidget {
  const NovoAnuncio({Key key}) : super(key: key);

  @override
  State<NovoAnuncio> createState() => _NovoAnuncioState();
}

class _NovoAnuncioState extends State<NovoAnuncio> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Anuncio'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key:_formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                FormField(),

                Row(children: [

                ],),

                BotaoCustomizado(
                  texto: "Cadastrar anuncio",
                  onPressed: (){

                    if(_formKey.currentState.validate()){



                    }

                  }),
                



            ],)),
        ),
      ),
    );
  }
}
