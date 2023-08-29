import 'package:flutter/material.dart';

//librerias de firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:pruebat/Pages/Home.dart';

import 'package:pruebat/Pages/Lista.dart';
import 'package:pruebat/Pages/Registrar.dart';
import 'firebase_options.dart';

//Servicios de Firestore
import 'package:pruebat/Services/FirestoreService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba Tecnica',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Prueba Tecnica'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp',
       initialRoute: '/',
      routes: {
          "/":(context)=> const Home();
          '/Add':(context) => const  Registrar(),
        '/View':(context) => const  Lista(),
      }
    );
  }
}
