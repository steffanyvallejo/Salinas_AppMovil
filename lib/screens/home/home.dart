import 'package:flutter/material.dart';
import 'package:salinas_app/Chat.dart';
import 'package:salinas_app/DetalleHabitacion.dart';
import 'package:salinas_app/screens/home/search_available.dart';
//import 'package:salinas_app/screens/noticias/noticias.dart';
import 'package:salinas_app/screens/tours/index2.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _children = [
    FilterForm(), ChatWidget(), HotelDetailsPage(), MyApp()//Aqui iba Noticias()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new Icon(Icons.menu),
        title: new Text(''),
        actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Notificaciones',
          onPressed: () {
          },
          ),
        ],
      ),
      
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlueAccent,
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
        items:bottomBar()
        ,
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}

List<BottomNavigationBarItem> bottomBar(){

  return [
    BottomNavigationBarItem(
      backgroundColor: Colors.lightBlueAccent[200],
      icon: new Icon(Icons.search),
      title: new Text('Search'),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.lightBlueAccent[200],
      icon: new Icon(Icons.history),
      title: new Text('History'),
    ),
    BottomNavigationBarItem(
        backgroundColor: Colors.lightBlueAccent[200],
        icon: Icon(Icons.shopping_cart),
        title: Text('Cart')
    ),
    BottomNavigationBarItem(
        backgroundColor: Colors.lightBlueAccent[200],
        icon: Icon(Icons.chat),
        title: Text('News')

    ),
  ];
}