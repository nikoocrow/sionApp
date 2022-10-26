import 'package:flutter/material.dart';


final tema = ThemeData.light();

final miTema = ThemeData(
  colorScheme: tema.colorScheme.copyWith(
      secondary: Colors.blue[400] 
  ), 
  appBarTheme: AppBarTheme(
    color: Colors.blue[400] 
  )
);