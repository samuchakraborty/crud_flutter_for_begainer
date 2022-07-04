import 'dart:convert';

import 'package:http/http.dart' as http;

import '../urls.dart';

class CustomerServices {
  static Stream<dynamic> getAllCustomer(
      ) async* {
    print(allCustomerUrl);
    http.Response response =
        await http.get(Uri.parse(allCustomerUrl), headers: {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    });
    print(response.body);
    yield jsonDecode(response.body);
  }
  static Future<dynamic> deleteCustomer(
      {required String id}
      ) async {
    print(deleteCustomerUrl + id);
    http.Response response =
    await http.post(Uri.parse(deleteCustomerUrl),
        body: {
        'c_id': id
        },
        headers: {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    });
    print(response.body);
    return (response.body);
  }



}
