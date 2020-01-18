import 'package:flutter/material.dart';
import 'package:salinas_app/models/tour_model.dart';
import 'network.dart';



const swatch_1 = Color(0xff91a1b4);
const swatch_2 = Color(0xffe3e6f3);
const swatch_3 = Color(0xffbabdd2);
const swatch_4 = Color(0xff545c6b);
const swatch_5 = Color(0xff363cb0);
const swatch_6 = Color(0xff09090a);
const swatch_7 = Color(0xff25255b);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ToursDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:TourIndex(title: 'Paquetes Turisticos'),
    );
  }
}
class TourIndex extends StatefulWidget{

  TourIndex({Key key,this.title}) : super(key:key);

  final String title;

  @override
  _TourIndexState createState() => _TourIndexState();

}

class _TourIndexState extends State<TourIndex> {

  Future<List<Tour>> future;
  double backgroundHeight = 180.0;
  @override
  void initState(){
    super.initState();

    future = getTours();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: swatch_3.withOpacity(0.5),
        elevation: 0.0,
        centerTitle: false,
        title:  Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(widget.title,
            style:TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right:26.0),
            child: InkWell(
              child: Icon(Icons.beach_access,
              color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: _body(),
    );
  }


  Widget _body() {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<List<Tour>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');

            return Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: backgroundHeight,
                  color: swatch_3.withOpacity(0.5),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: ListView.builder(
                    itemCount: snapshot.data.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                          child: Text("Paquetes Turisticos"),
                        );
                      }
                      if (index == 1) {
                        return _bigItem();
                      }

                      return _item(snapshot.data[index - 2]);
                    },
                  ),
                ),
              ],
            );
        }
        return null;
      },
    );
  }

  Widget _bigItem(){
    var screenWidth = MediaQuery
    .of(context)
    .size
    .width;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[ 
        Container(
          width: double.infinity,
          height: (screenWidth - 56) * 3 / 5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image.jpeg')
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Icon(Icons.play_arrow,
          size: 40.0,
          color: Color(0xff25255b),
          ),
        ),
      ],
    );
  }

  Widget _item(Tour tour){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      width: 42.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: swatch_5,
                      ),
                      child: Center(
                        child: Text(tour.title[0],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(tour.title,
                      style: TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ), 
                  ],
                  ),
                  SizedBox(height: 8.0),
                  Text(tour.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),  
                  Text("Precio del Tour: \$" + tour.price.toString(),
                    style: TextStyle(
                      color: swatch_4,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 16.0),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //image: AssetImage(tour.pathImage),
                  image: AssetImage('assets/item_1.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            )
          ],
        
        ),
      ),
    );
  }

}



