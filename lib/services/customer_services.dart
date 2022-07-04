import 'dart:convert';

import 'package:http/http.dart' as http;

import '../urls.dart';

class CustomerServices {
  static Stream<dynamic> getAllCustomer() async* {
    http.Response response =
        await http.get(Uri.parse(allCustomerUrl), headers: {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    });

    yield jsonDecode(response.body);
  }

  static Future<dynamic> deleteCustomer({required String id}) async {
    http.Response response =
        await http.post(Uri.parse(deleteCustomerUrl), body: {
      'c_id': id
    }, headers: {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    });

    return (response.body);
  }

  static Future<dynamic> updateCustomer(
      {required String id,
      required String name,
      required String mobile}) async {
    http.Response response =
        await http.post(Uri.parse(updateCustomerUrl), body: {
      'c_id': id,
      'c_fullname': name,
      'c_mobile': mobile
    }, headers: {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    });

    return (response.body);
  }
}
