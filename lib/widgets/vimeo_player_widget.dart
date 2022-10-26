import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';


class VimeoPlayerWidget extends StatelessWidget {


  final String  videoId ='70591644';

  @override
  Widget build(BuildContext context) {
    return  VimeoPlayer(
                videoId: videoId,
        );
  }
}