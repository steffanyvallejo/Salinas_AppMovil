import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:salinas_app/utils/navigation_router.dart';
import 'package:quiver/strings.dart';
import 'package:salinas_app/rest/access_rest.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> implements RegisterScreenContract {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isLoading = false;
  String _name = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  DateTime _dateBirth;

  RegisterScreenPresenter _presenter;

  _RegistrationScreenState() {
    _presenter = new RegisterScreenPresenter(this);
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      _presenter.doSingUp(_name, _lastName, new DateFormat("yyyy-MM-dd").format(_dateBirth), _email, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Por favor, ingrese un email!';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Por favor, ingrese un email válido!';
    else
      return null;
  }

  List<Widget> _buildForm(BuildContext context) {
    Form form = new Form(
      key: _formKey,
      child: new ListView(
        children: <Widget>[
          new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new TextFormField(
                keyboardType:
                    TextInputType.text, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'Ingresa tu nombre',
                  labelText: 'Nombre',
                  icon: new Icon(Icons.person),
                ),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Por favor, ingrese un nombre!';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              )),
          new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new TextFormField(
                keyboardType:
                    TextInputType.text, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'Ingresa tus apellidos',
                  labelText: 'Apellidos',
                  icon: new Icon(Icons.person),
                ),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Por favor, ingrese un apellido!';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _lastName = value;
                  });
                },
              )),
          new Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: new DateTimePickerFormField(
              inputType: InputType.date,
              format: DateFormat("dd-MM-yyyy"),
              initialDate: new DateTime.now(),
              editable: false,
              decoration: InputDecoration(
                labelText: 'Fecha nacimiento',
                hasFloatingPlaceholder: false,
                hintText: DateFormat("dd-MM-yyyy").format(new DateTime.now()),
                icon: new Icon(Icons.calendar_today),
              ),
              onSaved: (value) {
                setState(() {
                  _dateBirth = value;
                });
              },
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new TextFormField(
                keyboardType: TextInputType
                    .emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                    hintText: 'you@example.com',
                    labelText: 'Correo electrónico',
                    icon: new Icon(Icons.email)),
                validator: validateEmail,
                onSaved: (value) {
                  _email = value;
                },
              )),
          new Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: new TextFormField(
              key: _passKey,
              obscureText: true, // Use secure text for passwords.
              decoration: new InputDecoration(
                hintText: 'Ingresa tu contraseña',
                labelText: 'Contraseña',
                icon: new Icon(Icons.lock),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor, ingrese una contraseña!';
                }
              },
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: new TextFormField(
              obscureText: true, // Use secure text for passwords.
              decoration: new InputDecoration(
                  hintText: 'Ingresa tu contraseña',
                  labelText: 'Confirmación de Contraseña',
                  icon: new Icon(Icons.lock)),
              validator: (confirmPassword) {
                if (confirmPassword.isEmpty) {
                  return 'Por favor, confirmar la contraseña!';
                }
                var password = _passKey.currentState.value;
                if (!equalsIgnoreCase(confirmPassword, password)) {
                  return 'Las contraseñas no coinciden!';
                }
              },
              onSaved: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
          ),
          // new Container(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child: new TextFormField(
          //       obscureText: true, // Use secure text for passwords.
          //       decoration: new InputDecoration(
          //           hintText: 'Ecuador',
          //           labelText: 'País',
          //           icon: new Icon(Icons.map))),
          // ),
          // new Container(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child: new TextFormField(
          //       obscureText: true, // Use secure text for passwords.
          //       decoration: new InputDecoration(
          //           hintText: 'Quito',
          //           labelText: 'Ciudad',
          //           icon: new Icon(Icons.location_city))),
          // ),
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
                    onPressed: _submit,
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
    );

    var listWidget = new List<Widget>();

    listWidget.add(form);

    if (_isLoading) {
      var modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.1,
            child: const ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(),
          ),
        ],
      );
      listWidget.add(modal);
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Registro',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: _navigateRegistration,
        ),
      ),
      key: scaffoldKey,
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Stack(
          children: _buildForm(context),
        ),
      ),
    );
  }

  _navigateRegistration() {
    NavigationRouter.switchToLogin(context);
  }

  @override
  void onRegisterError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onRegisterSucces(String successTxt) async {
    _showSnackBar(successTxt);
    setState(() {
      _isLoading = false;
    });
    NavigationRouter.switchToLogin(context);
  }
}
