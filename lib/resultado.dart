import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function recomecar;

  const Resultado({
    super.key,
    required this.pontuacao,
    required this.recomecar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Parabéns!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Pontuação total: $pontuacao',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => recomecar(),
              style: const ButtonStyle(),
              child: const Text('Voltar ao início')),
        ],
      ),
    );
  }
}
