import 'package:flutter/material.dart';
import 'package:salinas_app/utils/navigation_router.dart';
import 'package:salinas_app/rest/access_rest.dart';
import 'package:salinas_app/models/customer.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> implements LoginScreenContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email, _password;

  LoginScreenPresenter _presenter;

  _UserLoginState() {
    _presenter = new LoginScreenPresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        _isLoading = true;
      });
      form.save();
      _presenter.doLogin(_email, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  List<Widget> _buildForm(BuildContext context) {
    Form form = new Form(
      key: this.formKey,
      child: new ListView(
        children: <Widget>[
          new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(
                    size: 100.0,
                  ),
                ],
              )),
          new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new TextFormField(
                  keyboardType: TextInputType
                      .emailAddress, // Use email input type for emails.
                  decoration: new InputDecoration(
                      hintText: 'you@example.com',
                      labelText: 'Correo electrónico',
                      icon: new Icon(Icons.email)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, ingresar un email!';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      _email = value;
                    });
                  })),
          new Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: new TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: new InputDecoration(
                    hintText: 'Password',
                    labelText: 'Contraseña',
                    icon: new Icon(Icons.lock)),
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                }),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Olvidaste la contraseña?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
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
                            child: new Text(
                              "Ingresar",
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
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.lightBlue,
                    onPressed: _navigateRegistration,
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
                              "Registrarse",
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
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
                Text(
                  "o conectate por",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Color(0Xff3B5998),
                            onPressed: () => {},
                            child: new Container(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: () => {},
                                      padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            "FACEBOOK",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
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
                ),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(left: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Color(0Xffdb3236),
                            onPressed: () => {},
                            child: new Container(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: () => {},
                                      padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            "GOOGLE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
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
                ),
              ],
            ),
          )
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
    _ctx = context;
    // MediaQueryData media = MediaQuery.of(context);
    // final Size screenSize = media.size;
    return new Scaffold(
      appBar: null,
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
    NavigationRouter.switchToSigUp(context);
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(Customer customer) async {
    print(customer);
    _showSnackBar("Bienvenido!");
    setState(() {
      _isLoading = false;
    });
    NavigationRouter.switchToHome(context);
  }
}
