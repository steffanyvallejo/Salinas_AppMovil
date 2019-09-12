import 'dart:convert';
import 'package:salinas_app/models/customer.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.56.1:8000/api_mobile";
const apiKey = "secreto";

abstract class LoginScreenContract {
  void onLoginSuccess(Customer customer);
  void onLoginError(String errorTxt);
}

abstract class RegisterScreenContract {
  void onRegisterSucces(String successTxt);
  void onRegisterError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  LoginScreenPresenter(this._view);
  
  Future<dynamic> doLogin(String email, String password) async {
    var data = {
      'email': email,
      'password': password
    };
    print(data);
    var client = new http.Client();
    try {
      var response = await client.post(baseUrl + '/login', body: data);
      String res = response.body;
      print(res);
      print(response.statusCode);
      if(response.statusCode==200){
        _view.onLoginSuccess(new Customer.fromJson(new JsonDecoder().convert(res)['customer']));
      }else{
        String messageError = new JsonDecoder().convert(res)['message_error'];
        _view.onLoginError(messageError);
      }
      client.close();
    } catch (e) {
      print(e);
      _view.onLoginError('Error en el servidor!');
    }
  }
}

class RegisterScreenPresenter {  
  RegisterScreenContract _view;
  RegisterScreenPresenter(this._view);
  
  Future<dynamic> doSingUp(String name, String lastName, String dateBirth, String email, String password) async {
    var data = {
      'nombres': name,
      'apellidos': lastName,
      'fecha_nacimiento': dateBirth,
      'email': email,
      'password': password
    };
    print(data);
    var client = new http.Client();
    try {
      var response = await client.post(baseUrl + '/register', body: data);
      String res = response.body;
      print(res);
      print(response.statusCode);
      if(response.statusCode==200){
        String messageSuccess = new JsonDecoder().convert(res)['message_success'];
        _view.onRegisterSucces(messageSuccess);
      }else{
        String messageError = new JsonDecoder().convert(res)['message_error'];
        _view.onRegisterError(messageError);
      }
      client.close();
    } catch (e) {
      print(e);
      _view.onRegisterError('Error en el servidor!');
    }
  }
}