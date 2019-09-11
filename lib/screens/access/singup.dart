import 'package:flutter/material.dart';
import 'package:salinas_app/utils/navigation_router.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Registro'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),

          child: new Form(

            child: new ListView(
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.all(20.0),
                    child:new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlutterLogo(
                          size: 100.0,
                        ),
                      ],
                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.text, // Use email input type for emails.
                        decoration: new InputDecoration(
                          hintText: 'Ingresa tu nombre',
                          labelText: 'Nombre',
                          icon: new Icon(Icons.person),
                        ),
                      validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Nickname is required';
                      }
                },

                )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.text, // Use email input type for emails.
                        decoration: new InputDecoration(
                          hintText: 'Ingresa tus apellidos',
                          labelText: 'Apellidos',
                          icon: new Icon(Icons.person),
                        )

                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: 'you@example.com',
                            labelText: 'Correo electrónico',
                            icon: new Icon(Icons.email))

                    )
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Ingresa tu contraseña',
                          labelText: 'Contraseña',
                          icon: new Icon(Icons.lock)

                      )
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Ingresa tu contraseña',
                          labelText: 'Confirmación de Contraseña',
                          icon: new Icon(Icons.lock)

                      )
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Ecuador',
                          labelText: 'País',
                          icon: new Icon(Icons.map)

                      )
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Quito',
                          labelText: 'Ciudad',
                          icon: new Icon(Icons.location_city)

                      )
                  ),
                ),

               new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                  alignment: Alignment.center,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          color: Colors.lightBlue,
                          onPressed: () => {},
                          child: new Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 20.0,
                            ),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Expanded(
                                  child: Text(
                                    "REGISTRAR",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ],
                  ),
                  ),
      ),
    );
  }
}