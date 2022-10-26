import 'package:flutter/material.dart';
import 'package:sion_app/widgets/vimeo_player_widget.dart';


class VimeoPlayerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
             Navigator.pushNamed(context, 'home');
          },
        ),
      ),
      body: VimeoPlayerWidget()
    );
   
  }
}