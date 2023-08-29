import 'package:flutter/material.dart';
import 'package:pruebat/Services/FirestoreService.dart';

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _Registrar();
}

class _Registrar extends State<Registrar> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController LastnameController = TextEditingController(text: "");
  TextEditingController EmailController = TextEditingController(text: "");
  TextEditingController PasswordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                //Use of SizedBox
                height: 30,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Ingrese un nombre",
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 10,
              ),
              const TextField(
                controller: LastnameController,
                decoration: InputDecoration(
                  hintText: "Ingrese un apellido",
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 10,
              ),
              const TextField(
                controller: EmailController,
                decoration: InputDecoration(
                  hintText: "Ingrese un correo",
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 10,
              ),
              const TextField(
                controller: PasswordController,
                decoration: InputDecoration(
                  hintText: "Ingrese una contraseña",
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                await ActualizarUsuario(
                        nameController.text,
                        LastnameController.text,
                        EmailController.text,
                        PasswordController.text)
                    .then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text("Guardar")),
        ],
      ),
    );
  }

  Future <void> ActualizarUsuario(String uid, String Nnombre, String Napellido,
      String NCorreo, String NContrasena) async {
    {
      await db.collection("Usuarios").doc(uid).set({"Nombre": Nnombre});
      await db.collection("Usuarios").doc(uid).set({"Apellido": Napellido});
      await db.collection("Usuarios").doc(uid).set({"Correo": NCorreo});
      await db.collection("Usuarios").doc(uid).set(
          {"Constraseña": NContrasena});
    }
  }
}
