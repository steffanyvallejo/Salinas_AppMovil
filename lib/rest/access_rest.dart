import 'dart:convert';
import 'package:salinas_app/models/customer.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.56.1:8000/api_mobile";
const apiKey = "secreto";

abstract class LoginScreenContract {
  void onLoginSuccess(Customer customer);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  // JsonDecoder _decoder = new JsonDecoder();
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
        String message_error = new JsonDecoder().convert(res)['message_error'];
        _view.onLoginError(message_error);
      }
    } catch (e) {
      print(e);
      _view.onLoginError('Error en el servidor!');
    }
  }
}