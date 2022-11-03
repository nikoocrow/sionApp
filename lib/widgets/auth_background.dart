import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthBackgroundWidget extends StatelessWidget {


  final Widget child;

  const AuthBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
  
    return Stack(

    
           children: [

           

            _loginBackground(),

             _mascota(),
         
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                  ),
                 child: Container(
                   child: child,
                   width: double.infinity,
                   height: 570,
                   color: Colors.grey[300],
                 ),
               ),
            ),

            
             
            
           ],
    );
  }
}

class _mascota extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Positioned(
     top: 60,
     right: 0,
     left: 0,
      child: Column(
        children: [
          Container(
            child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_pghdouhq.json', width: 250, height: 250),
         ),
         SizedBox(height: 10,),
         Text(
           'SHOJA', 
           style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)
           )
        ],
      ),
    );
  }
}

class  _loginBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),

      ),
  
      width: double.infinity,
      height:500,
      
    );
  }
}



