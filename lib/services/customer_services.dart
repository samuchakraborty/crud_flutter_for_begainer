import 'package:http/http.dart' as http;

import '../urls.dart';

class CustomerServices{


  Future<dynamic> getLogin(
      {required String mobileNumber, required String pin}) async {
    print(loginUrl);
    http.Response response = await http.post(Uri.parse(loginUrl),
        body: ({'si_mobile': mobileNumber, 'si_pin': pin}),
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        });
    return response.body;
  }




}