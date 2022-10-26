import 'package:flutter/material.dart';


class PalabrasScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Palabra del Pastor prometido'),
      ),
      body: Center(
        child: Text('Hola Palabras'),
     ),
   );
  }
}