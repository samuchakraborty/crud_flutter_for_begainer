import 'dart:convert';

import 'package:http/http.dart' as http;

import '../urls.dart';

class AuthServices {
  Future<dynamic> login() async {
    print('....');
    http.Response response = await http.post(Uri.parse(loginUrl),
        body: ({'si_mobile': "01879568886", 'si_pin': '14840'}),
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        });
    print(response.body);
    return response;
  }
}
