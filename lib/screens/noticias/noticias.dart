import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:salinas_app/models/Noticia.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:salinas_app/utils/ObtenerNoticias.dart';


const String url = "http://10.0.2.2:8000/api_mobile/noticias";

class Noticias extends StatefulWidget {
  @override
  NoticiasState createState() {
    print(url);
    return NoticiasState();
  }
}

class NoticiasState extends State<Noticias> {

  Future<List<Noticia>> listaNoticias = obtenerListaNoticias(url);

  Widget noticiaTemplate(noticia) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                noticia.titulo,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0),
              Image(
                image: NetworkImage(noticia.path_image),
              ),
              SizedBox(height: 6.0),
              Text(
                noticia.noticia,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Noticia>>(
      future: listaNoticias,
      builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
        List<Widget> children;
        if(snapshot.hasData){
          children = <Widget> [
            Column(
              children: snapshot.data.map((noticia) => noticiaTemplate(noticia)).toList(),
            ),
          ];
        }
        else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
          ];
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
   /* return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: listaNoticias.map((noticia) => noticiaTemplate(noticia)).toList(),
      ),
    );*/
  }
}
