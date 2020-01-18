  
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:salinas_app/models/tour_model.dart';
import 'dart:convert';

const String url = "http://192.168.56.1:8000/api_mobile/tours";

Future<List<Tour>> getTours() async {
  var data = await http.get(url);

  var jsonData = json.decode(data.body);

  List<Tour> tours = [];

  for(var u in jsonData){
    Tour t = Tour.fromJson(u);
    tours.add(t);
  }

  print(tours.length);
  print("Todo belen 1");

  return tours;
}