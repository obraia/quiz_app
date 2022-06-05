import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/questionario.dart';
import 'package:quiz_app/resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _contador = 0;

  final List<int> _pontuacoes = [];

  bool get _hasPerguntas {
    return _contador < questoes.length;
  }

  String get _pergunta {
    return questoes[_contador]['texto'].toString();
  }

  List<Map<String, Object>> get _respostas {
    return questoes[_contador]['respostas'] as List<Map<String, Object>>;
  }

  int get _pontuacao {
    return _pontuacoes.reduce((pontuacao, pontuacaoAtual) => pontuacao + pontuacaoAtual);
  }

  void _responder({required dynamic resposta}) {
    if (_hasPerguntas) {
      setState(() {
        _pontuacoes.add(resposta['pontuacao']);
        _contador++;
      });
    }

    if (kDebugMode) {
      print('Questão: $_contador, Resposta: $resposta');
      print('Pontuação: $_pontuacoes, Total: $_pontuacao');
    }
  }

  void _voltar() {
    if (_contador > 0) {
      setState(() {
        _pontuacoes.removeLast();
        _contador--;
      });
    }
  }

  void _recomecar() {
    setState(() {
      _pontuacoes.clear();
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text(_hasPerguntas ? 'Perguntas' : 'Resultado')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: _hasPerguntas
            ? Questionario(
                id: _contador,
                pergunta: _pergunta,
                respostas: _respostas,
                responder: _responder,
                voltar: _voltar,
              )
            : Resultado(
                pontuacao: _pontuacao,
                recomecar: _recomecar,
              ),
      ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  createState() {
    return _PerguntaAppState();
  }
}
