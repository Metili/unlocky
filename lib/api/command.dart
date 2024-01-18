import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:unlocky/api/config.dart';

class CallApi {
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  //login api
  Future<http.Response> login(String email, String password) async {
    Map data = {
      'mail': email,
      'password': password,
    };
    var body = json.encode(data);
    var url = Uri.parse(config.loginUrl);
    var res = await http.post(
      url,
      body: body,
      headers: _setHeaders(),
    );
    return res;
  }
}

//logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.remove('token');
}
