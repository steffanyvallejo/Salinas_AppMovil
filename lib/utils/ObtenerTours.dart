import 'dart:io';
import 'dart:convert';
import 'package:salinas_app/models/tour_model.dart';
import 'package:http/http.dart' as http;

// NO USO ESTE ARCHIVO PARA NADA
Future<TourList> obtenerListaTours(String url) async {

  //var toursJSON = obtenerToursJson(url);
  final toursJSON = 
    await http.get(url);
  
  if(toursJSON.statusCode == 200){
     TourList lista = TourList.fromJson(json.decode(toursJSON.body));
     return lista;//Adentro tiene una lista llamada tours
  }else{
    throw Exception('Failed to load tours');
  }

}


obtenerToursJson(url) async {
  print("antes del request de tours");
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