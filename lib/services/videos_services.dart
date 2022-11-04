import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sion_app/models/models.dart';
import 'package:http/http.dart' as http;

class VideosServices extends ChangeNotifier{

  final _urlBase = 'scj-sion-app-default-rtdb.firebaseio.com';
  final List<Videos> videos = [];



final storage = new FlutterSecureStorage();
 
  late Videos? selectedVideo;


  bool isloading = true;


  VideosServices(){
      loadVideos();
  }

  Future<List<Videos>>loadVideos() async{

  isloading = true;
  notifyListeners();

  final url = Uri.https(_urlBase,'videos.json',{
    'auth': await storage.read(key: 'token') ?? ''
  });


  
  final resp = await http.get(url);

  final Map<String, dynamic> videosMap = json.decode(resp.body);

  videosMap.forEach((key, value) {

  final tempVideo = Videos.fromMap(value);
    tempVideo.id = key;
    videos.add(tempVideo);

   });


     isloading = false;
     notifyListeners();
     return videos;
 
  }

}