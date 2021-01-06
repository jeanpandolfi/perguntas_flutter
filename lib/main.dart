import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

main(){
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget{

  @override
  _PerguntaAppState createState() => _PerguntaAppState();

}

class _PerguntaAppState extends State<PerguntaApp> {

  List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual é a sua cor favorida?",
      'respostas': ['Preto', 'Azul', 'Vermelho', 'Verde']
    },
    {
      'texto': "Qual é a sua comida favorita?",
      'respostas': ['Arroz', 'Feijão', 'Carne', 'Verdura']
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': ['Gato', 'Dog', 'Coleiro tui tui', 'Peixe']
    }
  ];

  var _perguntaSelecionada = 0;

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(){
    if(temPerguntaSelecionada){
      setState(() {
        this._perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    List<String> repostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]['respostas'] : null;
    List<Widget> widgetsResposta = repostas != null ? repostas.map((e) => new Resposta(e, _responder)).toList() : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada ? Column(
          children: [
            Questao(_perguntas[_perguntaSelecionada]['texto']),
            ...widgetsResposta
          ],
        ) : Resultado(),
      ),
    );
  }
}