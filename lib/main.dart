import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual é a sua cor favorida?",
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Azul', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 3},
        {'texto': 'Verde', 'nota': 1}
      ]
    },
    {
      'texto': "Qual é a sua comida favorita?",
      'respostas': [
        {'texto': 'Arroz', 'nota': 10},
        {'texto': 'Feijão', 'nota': 5},
        {'texto': 'Carne', 'nota': 3},
        {'texto': 'Verdura', 'nota': 1}
      ]
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': [
        {'texto': 'Gato', 'nota': 10},
        {'texto': 'Dog', 'nota': 5},
        {'texto': 'Coleiro tui tui', 'nota': 3},
        {'texto': 'Peixe', 'nota': 1}
      ]
    }
  ];

  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        this._perguntaSelecionada++;
        this._pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      this._pontuacaoTotal = 0;
      this._perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado( pontuacaoTotal: _pontuacaoTotal, quandoReiniciarQuestionario: _reiniciarQuestionario,),
      ),
    );
  }
}
