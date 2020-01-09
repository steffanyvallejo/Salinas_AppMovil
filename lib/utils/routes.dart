import 'package:flutter/material.dart';
import 'package:salinas_app/screens/access/login.dart';
import 'package:salinas_app/screens/access/profile.dart';
import 'package:salinas_app/screens/access/singup.dart';
import 'package:salinas_app/screens/home/home.dart';
import 'package:salinas_app/screens/access/splash.dart';
import 'package:salinas_app/screens/card/AddCard.dart';
import 'package:salinas_app/screens/cart/Cart.dart';
import 'package:salinas_app/screens/noticias/noticias.dart';

final routes = {
  '/login': (BuildContext context) => new UserLogin(),
  '/sigup': (BuildContext context) => new RegistrationScreen(),
  '/home': (BuildContext context) => new Home(),
  '/' : (BuildContext context) => new SplashScreen(),
  '/addCard' : (BuildContext context) => new AddCard(),
  '/cart' : (BuildContext context) => new Cart(),
  '/profile' : (BuildContext context) => new ProfilePage(),
  '/noticias' : (BuildContext context) => new Noticias(),
};