import 'package:flutter/material.dart';

class AuthBackgroundWidget extends StatelessWidget {


  final Widget child;

  const AuthBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
    
           children: [

            _loginBackground(),
         
    

            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                  ),
                 child: Container(
                   child: child,
                   width: double.infinity,
                   height: 600,
                    color: Colors.grey[100],
                 ),
               ),
            ),
             
            
           ],
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
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30))

      ),
  
      width: double.infinity,
      height: double.infinity
    );
  }
}



