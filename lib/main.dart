import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sion_app/screens/screens.dart';
import 'package:sion_app/services/services.dart';
import 'package:sion_app/theme/tema.dart';


void main() => runApp(AppState());


class AppState extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => VideosServices())
      ],
      child: MyApp(),
      
      );
  }
}

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