// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  int customer_id;
  String name;
  String last_name;
  String date_birth;
  String email;
  String username;

  Customer({
    this.customer_id,
    this.name,
    this.last_name,
    this.date_birth,
    this.email,
    this.username,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customer_id: json["customer_id"],
        name: json["name"],
        last_name: json["last_name"],
        date_birth: json["date_birth"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        'customer_id': customer_id,
        'name': name,
        'last_name': last_name,
        'date_birth': date_birth,
        'email': email,
        'username': username,
      };
}
