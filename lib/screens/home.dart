import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sion_app/screens/anuncios.dart';
import 'package:sion_app/screens/palabras.dart';
import 'package:sion_app/screens/screens.dart';
import 'package:sion_app/services/services.dart';





class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {




    return ChangeNotifierProvider(
      create: ( _ ) => new _NavegacionModel(),
      child: Scaffold(
        body: Screens(),
        bottomNavigationBar: _TabsNavigation(),
       ),
    );
  }
}


//AQUI VA LA NAVEGACIÓN DE LAS TABS

class _TabsNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return BottomNavigationBar(
      currentIndex: navegacionModel.pantallaActual,
      onTap: (i)=> navegacionModel.pantallaActual = i,
      items:[
        BottomNavigationBarItem(icon: Icon(Icons.play_circle_outlined),label: 'Servicios'),
        BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label:  'Palabra del dia'),
        BottomNavigationBarItem (icon: Icon(Icons.message_outlined),label:  'Anuncios'),
      ],
    );
  }
}


// AQUI VIENEN LAS DIFERENTES PANTALLAS
class Screens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context); /// LLAMA AL PAGE CONTROLER PARA SER USADO

    return PageView(
      controller: navegacionModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
          PlayerListScreen(),
          PalabrasScreen(),
          AnunciosScreen(),
      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _pantallaActual = 0;
  PageController _pageController = new PageController();


  int get pantallaActual => _pantallaActual;
  set pantallaActual(int valor){
    _pantallaActual = valor;

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();

  }
  PageController get pageController => _pageController;

}