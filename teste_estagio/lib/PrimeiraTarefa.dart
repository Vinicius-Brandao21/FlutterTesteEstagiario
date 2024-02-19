import 'package:flutter/material.dart';

class PrimeiraTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Next Estágio - Tarefa 1'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Olá, Next Tecnologia"),
                      ),
                    );
                  },
                  child: Icon(Icons.info),
                ),
                SizedBox(height: 16),
                Text(
                  "SnackBar Next",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
