import 'package:flutter/material.dart';
import 'package:sion_app/widgets/vimeo_card.dart';
import 'package:sion_app/widgets/vimeo_player_widget.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';




class PlayerListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
   
      appBar: AppBar(
        title: Text('Servicios'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.pushNamed( context , 'vimeo_player'),
          child: VimeoCard()
        ),
      ),
    );
  }
}
