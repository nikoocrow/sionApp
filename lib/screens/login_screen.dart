import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sion_app/widgets/widgets.dart';




import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100), //todo: quitar
              CardLoginContainerWidget(),
            ],
          ),
        )
      ),
   );
  }
}