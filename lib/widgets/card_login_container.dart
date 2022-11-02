import 'package:flutter/material.dart';
import 'package:sion_app/ui/inputs_decorations.dart';


class CardLoginContainerWidget extends StatelessWidget {
  const CardLoginContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
       child: Column(
        
        children: [
          const Text('Bienvenido', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,

          ),
          
          ),
          const SizedBox(height: 30),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: _Formulario(),
          )
        ],
      
     ),
    );
  }
}

class _Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         //CAMPO DE TEXTO USUARIO
        Container(
    
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child:TextField( 
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecorations(
                  hintText: 'usuario@correoelectronico.com',
                  labelText: 'Email'
                ),
            ),
          ),
        ),

        const SizedBox(height: 15),

  //CAMPO DE  CONTRASEÑA

  //CAMPO DE TEXTO USUARIO
        Container(
    
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child:TextField( 
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecorations(
                  hintText:  'ingresa ID de la iglesia',
                  labelText: 'Contraseña'
                ),
                ),
            ),
          ),
        

         const SizedBox(height: 30),

         Container(
          decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
               
              )

            ]
          ),
           child: MaterialButton(
             
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            disabledColor: Colors.grey,
            color: Color(0xFF00AAFF),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                'INGRESAR',
                style: TextStyle(color: Colors.white),
                )
            ),
            onPressed: (){
              Navigator.pushNamed(context, 'home');
            }
            
                 ),
         )

        
      ],
    );
  }
}