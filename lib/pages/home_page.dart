import 'package:flutter/material.dart';
import 'package:matriculasappg15/models/carrera_model.dart';
import 'package:matriculasappg15/models/matricula_model.dart';
import 'package:matriculasappg15/models/persona_model.dart';
import 'package:matriculasappg15/models/universidad_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PersonaModel> personas = [];

  List<Widget> listarElementos(List<MatriculaModel> matriculas) {
    return matriculas.map((matricula) {
      return ListTile(
        title: Text(
          "${matricula.carrera.nombre} - ${matricula.carrera.duracion}",
        ),
        subtitle: Text(
          "${matricula.estudiante.nombre} ${matricula.estudiante.apellido}",
        ),
        trailing: IconButton(
          onPressed: () {
            matriculas.remove(matricula);
            setState(() {});
          },
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      );
    }).toList();
  }

  UniversidadModel tecsup = UniversidadModel(
    nombre: "TECSUP",
    ruc: "2013131313131311313",
    direccion: "Av. Lima 123",
    telefono: "987654321",
    matriculas: [],
  );

  CarreraModel desarrollador = CarreraModel("Developer", "3 años");
  CarreraModel chef = CarreraModel("Chef", "5 años");
  CarreraModel civil = CarreraModel("Inge.civil", "5 años");

  PersonaModel estudiante1 = PersonaModel(
    nombre: "Luka",
    apellido: "Doncic",
    direccion: "Surinam",
    dni: "75332993891",
    nacionalidad: "Peruano",
  );

  PersonaModel estudiante2 = PersonaModel(
    nombre: "María",
    apellido: "Bellido",
    direccion: "Av sur 123",
    dni: "12345678",
    nacionalidad: "Colombiana",
  );

  Widget _buildCabeceraInstitucion(UniversidadModel institucion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(tecsup.nombre),
        IconButton(
          onPressed: () {
            tecsup.matriculas.add(
              MatriculaModel(
                fecha: "30/04/26",
                hora: "20:15",
                carrera: civil,
                estudiante: estudiante2,
              ),
            );
            setState(() {});
          },
          icon: Icon(Icons.add, color: Colors.blue),
        ),
        IconButton(
          onPressed: () {
            institucion.matriculas.clear();
            setState(() {});
          },
          icon: Icon(Icons.cleaning_services, color: Colors.red),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCabeceraInstitucion(tecsup),
            ...listarElementos(tecsup.matriculas),
          ],
        ),
      ),
    );
  }
}
