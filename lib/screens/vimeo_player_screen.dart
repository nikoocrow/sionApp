import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sion_app/services/services.dart';
import 'package:sion_app/theme/tema.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';


class VimeoPlayerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final videoServices = Provider.of<VideosServices>(context);

    final String videoId = videoServices.selectedVideo!.vimeoId.toString();

    return  Scaffold(
      backgroundColor: miTema.colorScheme.secondary,
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
             Navigator.pushNamed(context, 'home');
          },
        ),
      ),
      body: VimeoPlayer(
                videoId: videoId.toString(),
               
        )
    );
    print(videoId);
   
  }
}