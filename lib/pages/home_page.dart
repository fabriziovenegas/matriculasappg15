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
  List<UniversidadModel> instituciones = [];
  int? expandedIndex;

  void _eliminarMatriculaEspecifica(
    UniversidadModel universidadModel,
    MatriculaModel matriculaModel,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("¿Estás seguro que quieres eliminar esta matrícula?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                universidadModel.matriculas.remove(matriculaModel);
                setState(() {});
                Navigator.pop(context);
              },
              child: Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }

  void editarMatricula(MatriculaModel matricula) {
    TextEditingController carreraController = TextEditingController(
      text: matricula.carrera.nombre,
    );

    TextEditingController nombreController = TextEditingController(
      text: matricula.estudiante.nombre,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Editar matrícula"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: carreraController,
                decoration: InputDecoration(labelText: "Carrera"),
              ),
              SizedBox(height: 12),

              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: "Nombre y apellido"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),

            ElevatedButton(
              onPressed: () {
                matricula.carrera.nombre = carreraController.text;

                matricula.estudiante.nombre = nombreController.text;

                setState(() {});

                Navigator.pop(context);
              },
              child: Text("Guardar"),
            ),
          ],
        );
      },
    );
  }

  void _eliminarMatriculas(UniversidadModel universidadModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Limpiar todas las matrículas"),
          content: Text(
            "Estás seguro de eliminar todas las matrículas de ${universidadModel.nombre}?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                universidadModel.matriculas.clear();
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Sí, eliminar"),
            ),
          ],
        );
      },
    );
  }

  List<Widget> listarElementos(
    UniversidadModel universidadModel,
    List<MatriculaModel> matriculas,
  ) {
    return matriculas.map((matricula) {
      return ListTile(
        title: Text(
          "${matricula.carrera.nombre} - ${matricula.carrera.duracion}",
        ),
        subtitle: Text(matricula.estudiante.nombre),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                editarMatricula(matricula);
              },
              icon: Icon(Icons.edit, color: Colors.blue),
            ),

            IconButton(
              onPressed: () {
                _eliminarMatriculaEspecifica(universidadModel, matricula);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
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
        Text(institucion.nombre),
        IconButton(
          onPressed: () {
            institucion.matriculas.add(
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
            _eliminarMatriculas(institucion);
          },
          icon: Icon(Icons.cleaning_services, color: Colors.red),
        ),
      ],
    );
  }

  Widget _buildExpansionInstitucion(
    int index,
    UniversidadModel universidadModel,
  ) {
    return ExpansionTile(
      key: ValueKey("ExpansionTile_$index${expandedIndex == index}"),
      initiallyExpanded: expandedIndex == index,
      tilePadding: EdgeInsets.symmetric(horizontal: 32),
      childrenPadding: EdgeInsets.symmetric(horizontal: 24),
      title: _buildCabeceraInstitucion(universidadModel),
      children: listarElementos(universidadModel, universidadModel.matriculas),
      onExpansionChanged: (bool isOpen) {
        expandedIndex = isOpen ? index : null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matrículas App"),
        actions: [
          IconButton(
            onPressed: () {
              TextEditingController universidadController =
                  TextEditingController();
              TextEditingController direccionController =
                  TextEditingController();
              TextEditingController telefonoController =
                  TextEditingController();
              TextEditingController rucController = TextEditingController();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Universidad"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: universidadController,
                          decoration: InputDecoration(
                            labelText: "Introduce la universidad",
                          ),
                        ),
                        SizedBox(height: 12),

                        TextField(
                          controller: direccionController,
                          decoration: InputDecoration(
                            labelText: "Introduce la dirección",
                          ),
                        ),
                        SizedBox(height: 12),

                        TextField(
                          controller: telefonoController,
                          decoration: InputDecoration(
                            labelText: "Introduce el teléfono",
                          ),
                        ),
                        TextField(
                          controller: rucController,
                          decoration: InputDecoration(
                            labelText: "Introduce el RUC",
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          instituciones.add(
                            UniversidadModel(
                              nombre: universidadController.text,
                              ruc: rucController.text,
                              direccion: direccionController.text,
                              telefono: telefonoController.text,
                              matriculas: [],
                            ),
                          );
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Text("Guardar"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.add_business_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < instituciones.length; i++)
              _buildExpansionInstitucion(i, instituciones[i]),
            // ...instituciones.map((e) {
            //   return _buildExpansionInstitucion(e);

            // }),
            // Divider(),

            // _buildCabeceraInstitucion(tecsup),
            // ...listarElementos(tecsup.matriculas),
          ],
        ),
      ),
    );
  }
}
