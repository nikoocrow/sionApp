import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authInputDecorations({
    required   String hintText,
    required   String labelText,
  }){
    
    return  InputDecoration(
        border: InputBorder.none,
             hintText:  hintText,
             labelText: labelText,
             labelStyle: TextStyle(
             color: Color(0xFF00AAFF),
             ),
    );
  }

}