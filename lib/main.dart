import 'package:flutter/material.dart';
import 'package:sion_app/screens/anuncios.dart';
import 'package:sion_app/screens/home.dart';
import 'package:sion_app/screens/login_screen.dart';
import 'package:sion_app/screens/palabras.dart';
import 'package:sion_app/screens/player_list_screen.dart';
import 'package:sion_app/screens/user_settings.dart';
import 'package:sion_app/screens/screens.dart';
import 'package:sion_app/screens/vimeo_player_screen.dart';
import 'package:sion_app/theme/tema.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: miTema,
      initialRoute: 'home',
      routes: {
        'home'         : ( _ ) =>HomeScreen(), 
        'player_list'  : ( _ ) => PlayerListScreen(),
        'vimeo_player' : ( _ ) => VimeoPlayerScreen(),
        'palabras'     : ( _ ) => PalabrasScreen(),
        'anuncios'     : ( _ ) => AnunciosScreen(),
        'user_settings': ( _ ) => UserSettingsScreen(), 
        'login'        : ( _ ) => LoginScreen(),
      },
   
    );
  }
}