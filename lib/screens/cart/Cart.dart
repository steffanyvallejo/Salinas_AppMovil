import 'package:flutter/material.dart';
import 'package:salinas_app/widgets/product_card.dart';
class Cart extends StatefulWidget{
  static final String route = "Cart-route";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartState();
  }
}

class CartState extends State<Cart>{


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        appBar:AppBar(
          elevation: 0.0,
          title: Text("Cart List"),
        ),
        backgroundColor: Colors.white,
        body:SafeArea(
          child: ListView(
            children: <Widget>[
              ProductCard(
                quantity: 1,
                name: 'Habitación presidencial',
                price: 24.00,
                picture: '',
              ),
              ProductCard(
                quantity: 2,
                name: 'Suite para 2',
                price: 1000.45,
                picture: '',
              ),
            ],
          ),
        )
    );
  }
}