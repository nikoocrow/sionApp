import 'package:flutter/material.dart';
import 'package:sion_app/models/models.dart';


class VimeoCard extends StatelessWidget {

  final Videos  videos;

  const VimeoCard({
    super.key,
     required this.videos
   }); 

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
            _BackgroundImage(videos.tumbnail),
            _VideoDetails(
              title: videos.titulo,
               date: videos.fecha,
            )
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



  final String title;
  final String date;

  const _VideoDetails({
    required this.title,
    required this.date
  });


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
                title, // Titulo del video va aqui
                 style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 ),
                   Text(
                 date,  //FECHA VA AQUI
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

   final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 250,
        child: FadeInImage(
          placeholder: AssetImage('assets/video_placeholder.png'),
          imageErrorBuilder: (BuildContext context, Object obj, stackTrace){
              return Image(image: AssetImage('assets/video_placeholder.png'),
              fit: BoxFit.cover
              );
         },
        image: NetworkImage(url.toString()),
        fit: BoxFit.cover
      )
         
      ),
    );
  }
}