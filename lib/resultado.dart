import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacaoTotal;
  final void Function() quandoReiniciarQuestionario;

  Resultado({this.pontuacaoTotal, this.quandoReiniciarQuestionario});

  String get fraseResultado{
    if(pontuacaoTotal < 8) {
      return "Parabéns!";
    }else if(pontuacaoTotal < 12){
      return "Você é bom!";
    }else if(pontuacaoTotal < 16){
      return "Impressionate!";
    }else{
      return "Nível Jedi! Brabo deMais";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado,
              style: TextStyle(fontSize: 28)),
        ),
        FlatButton(
            onPressed: quandoReiniciarQuestionario,
            child: Text("Reiniciar?", style: TextStyle( fontSize: 18),),
            textColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid
                )
            )
        )
      ],
    );
  }
}
