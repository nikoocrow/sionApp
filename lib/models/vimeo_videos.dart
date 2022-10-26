// To parse this JSON data, do
//
//     final videos = videosFromMap(jsonString);

import 'dart:convert';

class Videos {
    Videos({
        required this.fecha,
        required this.titulo,
        this.tumbnail,
        this.vimeoId,
    });

    String fecha;
    String titulo;
    String? tumbnail;
    int? vimeoId;
    String ?id;

    factory Videos.fromJson(String str) => Videos.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Videos.fromMap(Map<String, dynamic> json) => Videos(
        fecha: json["fecha"],
        titulo: json["titulo"],
        tumbnail: json["tumbnail"],
        vimeoId: json["vimeoId"],
    );

    Map<String, dynamic> toMap() => {
        "fecha": fecha,
        "titulo": titulo,
        "tumbnail": tumbnail,
        "vimeoId": vimeoId,
    };

  
}
