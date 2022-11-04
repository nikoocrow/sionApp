import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sion_app/services/videos_services.dart';
import 'package:sion_app/widgets/widgets.dart';
import 'package:sion_app/screens/screens.dart';
import 'package:sion_app/services/services.dart';






class PlayerListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final  videosService = Provider.of<VideosServices>(context);
    final  authServices =  Provider.of<AuthServices>(context, listen: false);



    if(videosService.isloading)  return LoadingScreen();



    return Scaffold(
     
      appBar: AppBar(
        title: Text('Servicios'),
        actions:[ 
          IconButton(
          icon: Icon(Icons.logout_outlined),

          onPressed: () async {

            await authServices.logout();
            Navigator.pushReplacementNamed(context, 'login');

          }
         ),
       ]
      ),
      
      body: ListView.builder(
        itemCount: videosService.videos.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: (){
            videosService.selectedVideo = videosService.videos[index];
            Navigator.pushNamed( context , 'vimeo_player');
          },
          child: VimeoCard(
            videos: videosService.videos[index],
          )
        ),
      ),
    );
  }
}
