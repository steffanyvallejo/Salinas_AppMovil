import 'package:flutter/material.dart';
import 'package:salinas_app/models/tour_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String url = "http://192.168.56.1:8000/api_mobile/tours";

class TourIndex extends StatefulWidget{
  @override
  TourIndexState createState(){
    return TourIndexState();
  }
}

class TourIndexState extends State<TourIndex>{

  Future<List<Tour>> _getTours() async{
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home:Container(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.beach_access),
                SizedBox(width: 16.0),
                Text("Paquetes Turisticos"),
              ],
            ),
          ),
          body: Container(
            child: FutureBuilder(
              future: _getTours(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    if(snapshot.data == null){
                      return Container(
                        child:Center(
                          child: Text("Loading"),)
                      );
                    }else{
                      return tourUnitWidget(snapshot.data[index]);
                    }
                  },
                );
              },
            ),
          ),
        ),
      )
    );
  }
}

Widget header(){ //No lo uso :(
  return Stack(
    children: <Widget>[
      Container(
        height: 100.0,
        width:double.infinity,
        child: Text("Aqui deberia ir Escoger Fecha"),
      )
    ],
  );
}


Widget tourUnitWidget(Tour tour) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(tour.title),
          ),
          Expanded(
            child: Text(
              tour.price.toString(),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    ),
  );
}

