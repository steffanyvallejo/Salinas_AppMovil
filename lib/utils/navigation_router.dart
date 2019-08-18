import 'package:flutter/material.dart';
import 'package:salinas_app/singup_screen.dart';
import 'package:salinas_app/home_screen.dart';

class NavigationRouter {
  static void switchToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login_screen");
  }

  static void switchToRegistration(BuildContext context) {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) =>
        new RegistrationScreen())
    );
  }

  static void switchToHome(BuildContext context) {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) =>
        new Home())
    );
  }
  static void switchToProfile(BuildContext context) {
    Navigator.pushNamed(context, "/ProfileScreen");
  }

}
