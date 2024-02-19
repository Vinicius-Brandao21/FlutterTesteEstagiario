import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_estagio/TerceiraTarefaDetalhe.dart';
import 'dart:convert';

class TerceiraTarefa extends StatefulWidget {
  @override
  _TerceiraTarefaState createState() =>
      _TerceiraTarefaState(); // cep: this.cep --> ISSO AQUI
}

class _TerceiraTarefaState extends State<TerceiraTarefa> {
  List<dynamic> enderecos = [];

  @override
  void initState() {
    super.initState();
    fetchAddress();
  }

  Future<void> fetchAddress() async {
    String estado = 'SP';
    String cidade = 'Cruzeiro';
    String logradouro = 'Souza';

    final url =
        Uri.parse('https://viacep.com.br/ws/$estado/$cidade/$logradouro/json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          enderecos = data;
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
        body: ListView.builder(
            itemCount: enderecos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(enderecos[index]['cep']),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return TerceiraTarefaDetalhe(
                          cep: enderecos[index]['cep']);
                    },
                  ));
                },
              );
            }));
  }
}
