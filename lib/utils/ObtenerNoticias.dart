import 'dart:io';
import 'dart:convert';
import 'package:salinas_app/models/Noticia.dart';

Future<List<Noticia>> obtenerListaNoticias(url) async {
  print("llamada a obtener lista");
  var noticiasString = await obtenerNoticias(url);
  print(noticiasString);
  var noticiasList = noticiasString.substring(1, noticiasString.length-1).split("},");

  List<Noticia> listaObjetosNoticia = [];

  var lengthNoticias = noticiasList.length;

  for(int i = 0; i< lengthNoticias-1; i++){
    var noticiaActual = noticiasList[i]+"}";
    listaObjetosNoticia.add(Noticia.fromJson(jsonDecode(noticiaActual)));
  }

  var noticiaActual = noticiasList[lengthNoticias-1];
  listaObjetosNoticia.add(Noticia.fromJson(jsonDecode(noticiaActual)));
  print(listaObjetosNoticia);
  return listaObjetosNoticia;
}

obtenerNoticias(url) async {
  print("antes del request");
  // produces a request object
  var request = await HttpClient().getUrl(Uri.parse(url));

  // sends the request
  var response = await request.close();
  var result;
  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    result = contents;
  }
  print("despues del request");
  return result;
}