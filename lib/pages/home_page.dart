import 'package:flutter/material.dart';
import 'package:matriculasappg15/models/persona_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PersonaModel> personas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                personas.add(
                  PersonaModel(
                    nombre: "Fabrizio",
                    apellido: "Venegas",
                    direccion: "Surinam",
                    dni: "12345678",
                    nacionalidad: "Peruano",
                  ),
                );
              },
              child: Text("Agregar persona"),
            ),
          ],
        ),
      ),
    );
  }
}
