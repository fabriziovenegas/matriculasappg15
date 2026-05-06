import 'package:matriculasappg15/models/matricula_model.dart';

class UniversidadModel {
  String nombre;
  String ruc;
  String direccion;
  String telefono;
  List<MatriculaModel> matriculas;

  UniversidadModel({
    required this.nombre,
    required this.ruc,
    required this.direccion,
    required this.telefono,
    required this.matriculas,
  });
}
