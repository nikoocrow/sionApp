import 'package:flutter/material.dart';


class VimeoCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
     
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        height: 250,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(),
            _VideoDetails()
          ],
        ),
        
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color:  Colors.black12,
        offset: Offset(0,5),
        blurRadius: 10
        

      )
    ]
  );
}

class _VideoDetails extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _BuildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Servicio dominical',
                 style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 ),
                   Text(
                '23 de Octubre',
                 style: TextStyle(fontSize: 15, color: Colors.white),
                 ),
            ],
        ),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
    color:Colors.blue,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
  );
}

class _BackgroundImage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Container(
      width: double.infinity,
      height: 250,
      child: FadeInImage(
        placeholder: AssetImage('assets/Rolling.gif'),
        image: AssetImage('assets/video_placeholder.png'),
      
      ),
    );
  }
}