import 'package:flutter/material.dart';

class ExpansiontilePage extends StatelessWidget {
  const ExpansiontilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpansionTile")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpansionTile(
              title: Text("Título"),
              subtitle: Text("Subtítulo"),
              leading: Icon(Icons.person),
              // trailing: Icon(Icons.abc),
              initiallyExpanded: true,
              onExpansionChanged: (bool isOpen) {
                print("Está abierto? : $isOpen");
              },
              collapsedBackgroundColor: Colors.red, //Color cuando esta cerrado
              backgroundColor: Colors.blueGrey, //Color cuando esta expandido
              iconColor: Colors.yellow,
              textColor: Colors.orange,
              children: [
                ListTile(title: Text("Elemento 1")),
                ListTile(title: Text("Elemento 1")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
