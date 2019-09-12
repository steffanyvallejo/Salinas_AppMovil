import 'package:flutter/material.dart';
import 'package:salinas_app/screens/access/login.dart';
import 'package:salinas_app/screens/access/singup.dart';
import 'package:salinas_app/screens/home/home.dart';
import 'package:salinas_app/screens/access/splash.dart';
import 'package:salinas_app/screens/card/AddCard.dart';

final routes = {

  '/login': (BuildContext context) => new UserLogin(),
  '/sigup': (BuildContext context) => new RegistrationScreen(),
  '/home': (BuildContext context) => new Home(),
  '/' : (BuildContext context) => new SplashScreen(),
  '/addCard' : (BuildContext context) => new AddCard(),
};