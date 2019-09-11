import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salinas_app/utils/routes.dart';

void main() {
  debugPaintSizeEnabled = false; //true para que se muestren las cuadriculas
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          // ... delegado[s] de localización específicos de la app aquí
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'), // Inglés
          const Locale('es'), // Español
        ],
        title: 'Hotel Salinas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            primarySwatch: Colors.cyan,
            primaryColorDark: Colors.lightBlueAccent),
        routes: routes,);
  }
}