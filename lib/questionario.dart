import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;


  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> repostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada]['respostas'] : null;
    List<Widget> widgetsResposta = repostas != null ? repostas.map((e) => new Resposta(e['texto'], () => quandoResponder(e['nota']))).toList() : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...widgetsResposta
      ],
    );
  }
}
