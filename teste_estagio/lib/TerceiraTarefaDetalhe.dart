import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TerceiraTarefaDetalhe extends StatefulWidget {
  String cep = '';

  TerceiraTarefaDetalhe({required this.cep});

  @override
  _TerceiraTarefaDetalheState createState() =>
      _TerceiraTarefaDetalheState(cep: this.cep);
}

class _TerceiraTarefaDetalheState extends State<TerceiraTarefaDetalhe> {
  String cep = '';
  String logradouro = '';
  String complemento = '';
  String bairro = '';
  String cidade = '';
  String estado = '';

  _TerceiraTarefaDetalheState({required this.cep});

  @override
  void initState() {
    super.initState();
    fetchAddress();
  }

  Future<void> fetchAddress() async {
    final url = Uri.parse('https://viacep.com.br/ws/$cep/json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          cep = data['cep'];
          logradouro = data['logradouro'];
          complemento = data['complemento'];
          bairro = data['bairro'];
          cidade = data['localidade'];
          estado = data['uf'];
        });
      } else {
        print(
            'Erro ao buscar os endereços. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Next Estágio - Tarefa 3'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CEP: $cep'),
            Text('Logradouro: $logradouro'),
            Text('Complemento: $complemento'),
            Text('Bairro: $bairro'),
            Text('Cidade: $cidade'),
            Text('Estado: $estado'),
          ],
        ),
      ),
    );
  }
}
