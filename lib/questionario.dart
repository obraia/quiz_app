import 'package:flutter/material.dart';
import 'package:quiz_app/questao.dart';
import 'package:quiz_app/resposta.dart';

class Questionario extends StatelessWidget {
  final int id;
  final String pergunta;
  final List<Map<String, Object>> respostas;
  final Function responder;
  final Function voltar;

  const Questionario({
    super.key,
    required this.id,
    required this.pergunta,
    required this.respostas,
    required this.responder,
    required this.voltar,
  });

  Column _buildRespostas(BuildContext context) {
    List<Resposta> listaRespostas = [];

    for (var resposta in respostas) {
      listaRespostas.add(Resposta(
        resposta['texto'].toString(),
        () => responder(resposta: resposta),
      ));
    }

    return Column(
      children: listaRespostas,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Questao(pergunta),
      _buildRespostas(context),
      if (id > 0)
        ElevatedButton(
          onPressed: () => voltar(),
          child: const Text('Voltar'),
        )
    ]);
  }
}
