import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsuarios() async {
  List Usuarios=[];
  QuerySnapshot querySnapshot = await db.collection('Usuarios').get();
  for(var doc in querySnapshot.docs){
    final Map<String,dynamic> data=doc.data()as Map<String,dynamic>;
    final Usuario={
      "Nombre": data['Nombre'],
      "Apellido":data['Apellido'],
      "Correo":data['Correo'],
      "Contraseña":data['Contraseña'],
      "uid":data["uid"],
    };
    Usuarios.add(Usuario);

  }
  await Future.delayed(const Duration(seconds: 5));
  return Usuarios;
}
Future <void> RegistrarUsuario(String nombre,String Apellido,String Contrasena,String correo,String contrasena)async {
  {
    await db.collection("Usuarios").add({"Nombre": nombre});
    await db.collection("Usuarios").add({"Apellido": Apellido});
    await db.collection("Usuarios").add({"Correo": correo});
    await db.collection("Usuarios").add({"Constraseña": Contrasena});
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
  Future<void> EliminarUsuario(String uid) async {
    await db.collection("Usuarios").doc(uid).delete();
  }
}