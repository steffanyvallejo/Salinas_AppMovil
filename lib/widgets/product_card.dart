import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String picture;
  final int quantity;


  ProductCard({@required this.name,@required this.price,@required this.picture,@required this.quantity});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/room1.jpg",
                height: 90,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 10,),

          RichText(text: TextSpan(
              children: [
                TextSpan(text: '$name \n', style: TextStyle(fontSize: 20),),
                TextSpan(text: 'Qty: ${quantity.toString()} \n', style: TextStyle(fontSize: 16, color: Colors.grey),),

                TextSpan(text: '\$${price.toString()} \t', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),


              ], style: TextStyle(color: Colors.black)
          ),)
        ],
      ),
    );
  }
}