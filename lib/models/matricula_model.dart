import 'package:matriculasappg15/models/carrera_model.dart';
import 'package:matriculasappg15/models/persona_model.dart';

class MatriculaModel {
  String fecha;
  String hora;
  PersonaModel estudiante;
  CarreraModel carrera;
  MatriculaModel({
    required this.fecha,
    required this.hora,
    required this.carrera,
    required this.estudiante,
  });
}
