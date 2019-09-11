import 'package:flutter/material.dart';
// import 'package:salinas_app/utils/routes.dart';
// import '../habitaciones_screen.dart';

class NavigationRouter {
  static void switchToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  static void switchToSigUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/sigup');
  }

  static void switchToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  // static void switchToRegistration(BuildContext context) {
  //   Navigator.push(context, new MaterialPageRoute(
  //       builder: (context) =>
  //       new RegistrationScreen())
  //   );
  // }

  // static void switchToHome(BuildContext context) {
  //   Navigator.push(context, new MaterialPageRoute(
  //       builder: (context) =>
  //       new Home())
  //   );
  // }


  // static void switchToRooms(BuildContext context) {
  //   Navigator.push(context, new MaterialPageRoute(
  //       builder: (context) =>
  //       new habitaciones_screen())
  //   );
  // }
  // static void switchToProfile(BuildContext context) {
  //   Navigator.pushNamed(context, "/ProfileScreen");
  // }

}
