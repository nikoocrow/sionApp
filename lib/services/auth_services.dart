import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices extends ChangeNotifier{

final String _baseURL = 'identitytoolkit.googleapis.com';
final String _firebaseToken = 'AIzaSyBxt1SF0CY5vkB6mxu4hwzBWxKeZm9B-4I';


final storage = new FlutterSecureStorage();

//TODO CREACION DE USUARIOS AQUI
/*
//Si retornamos algo es un error si no?, todo bien
Future<String?> createUser(String email, String password) async{
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final url = Uri.https(_baseURL, '/v1/accounts:signUp',{
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('idToken')){
      //Token hay que guardarlo en un lugar seguro
      //return decodedResp['idToken'];
      return null;
    }
    else{
      return decodedResp['error']['message'];
    }


 }*/


 Future<String?> login(String email, String password) async{
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final url = Uri.https(_baseURL, '/v1/accounts:signInWithPassword',{
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);


    if(decodedResp.containsKey('idToken')){
      await storage.write(key: 'token', value: decodedResp['idToken']);
      //Token hay que guardarlo en un lugar seguro
      //return decodedResp['idToken'];
      return null;
    }
    else{
      return decodedResp['error']['message'];
    }
   }


  Future logout() async{

    await storage.delete(key: 'token');
    return;

  }

    Future<String> readToken() async{

      return await storage.read(key: 'token') ?? '';

    }




}