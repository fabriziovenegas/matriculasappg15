import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  TextEditingController correoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(correoController);
          print(correoController.text);
        },
      ),
      appBar: AppBar(title: Text("Textfield Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: TextStyle(color: Colors.red),
                maxLength: 20,
                controller: correoController,
                decoration: InputDecoration(
                  // counterText: "hola",
                  labelText: "Correo",
                  hint: Text("Ingrese el correo"),
                  prefixIcon: Icon(Icons.email),
                  suffix: Text(".com.pe"),
                ),
                onChanged: (String value) {
                  // print(value);
                },
              ),
              SizedBox(height: 32),
              TextField(
                controller: contrasenaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  hintText: "Ingresa la contraseña",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  hintStyle: TextStyle(color: Colors.cyan),
                ),
                onChanged: (String value) {},
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  String correo = correoController.text;
                  String contrasena = contrasenaController.text;

                  print(correo);
                  print(contrasena);
                },
                child: Text("Obtener información"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
