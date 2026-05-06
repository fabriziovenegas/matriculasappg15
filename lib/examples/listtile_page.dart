import 'package:flutter/material.dart';

class ListtilePage extends StatelessWidget {
  const ListtilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List tile Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Fabrizio Venegas"),
                subtitle: Text("Disponible"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("tapeado");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
