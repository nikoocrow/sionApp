import 'package:flutter/material.dart';
import 'package:sion_app/providers/login_form_provider.dart';
import 'package:sion_app/services/services.dart';
import 'package:sion_app/ui/inputs_decorations.dart';
import 'package:provider/provider.dart';


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



            ChangeNotifierProvider(
              create: ( _ ) => LoginFormProvider() ,
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

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
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
                child:TextFormField( 
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecorations(
                      hintText: 'usuario@correoelectronico.com',
                      labelText: 'Email'
                    ),
                    onChanged: (value) => loginForm.email = value,
                    validator: (value){
                      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp  = new RegExp(pattern);
                      return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El email digitado no luce adecuado';
                    },
                    
                ),
                
              ),
            ),
          
            const SizedBox(height: 15),
          
        //CAMPO DE  CONTRASEÑA
          
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child:TextFormField( 
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecorations(
                      hintText:  'ingresa ID de la iglesia',
                      labelText: 'Contraseña'
                    ),
                    onChanged: (value) => loginForm.password = value,
                    validator: (value) {
                      return (value != null && value.length >=6)
                      ? null
                      :'La contraseña debe ser el ID de la iglesia';
                    },
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
                    loginForm.isLoading
                    ? 'Espera'
                    : 'Ingresar',
                    style: TextStyle(color: Colors.white),
                    )
                ),
                onPressed: loginForm.isLoading ? null : () async{

                  FocusScope.of(context).unfocus();
                  final authServices = Provider.of<AuthServices>(context, listen: false);

                  if(!loginForm.isValidForm()) return;

                 loginForm.isLoading = true;
     
                 //TODO VALIDAR SI EL LOGIN ES CORRECTO

                final String? errorMessage = await authServices.login(loginForm.email, loginForm.password); 
               
                if(errorMessage == null){
                      Navigator.pushReplacementNamed(context, 'home');
                }else {
                  print(errorMessage);

                  // if(errorMessage.length != null){

                  //   errorMessage = 'jañj';
                  // }
                  NotificationsServices.showSnackbar(errorMessage);
                }

              loginForm.isLoading = false;
             
              }
                
                     ),
             )
          
            
          ],
        ),
      ),
    );
  }
}