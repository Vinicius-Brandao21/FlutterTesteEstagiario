import 'package:flutter/material.dart';

class SegundaTarefa extends StatelessWidget {
  final List<String> items = [
    'Sopa',
    'Televisão',
    'Mouse',
    'Monitor',
    'Celular'
  ];

  final List<String> conteudo = [
    'Macarrão, Molho e Carne',
    'Televisao de 55 polegadas 4K',
    'Mouse sem fio 5000 DPI',
    'Monitor LG 75hz',
    'Motorola MotoG4 32gb de armazenamento'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Next Estágio - Tarefa 2'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Conteúdo do ${items[index]}'),
                    content: Text('${conteudo[index]}.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fechar'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
