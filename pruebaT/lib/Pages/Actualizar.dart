import 'dart:io';


import 'package:flutter/material.dart';

class Actualizar extends StatefulWidget {
  const Actualizar({super.key});

  @override
  State<Actualizar> createState() => _Actualizar();
}

class _Actualizar extends State<Actualizar> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ],
    );
  }
}