
import 'package:http/http.dart' as http;

import '../urls.dart';

class AuthServices {
  Future<dynamic> getLogin(
      {required String mobileNumber, required String pin}) async {
    print('....');
    http.Response response = await http.post(Uri.parse(loginUrl),
        body: ({'si_mobile': mobileNumber, 'si_pin': pin}),
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        });
    return response.body;
  }

  Future<dynamic> getRegistration(
      {required String name,
      required String mobileNumber,
      required String pin}) async {
    http.Response response = await http.post(Uri.parse(registrationUrl),
        body: ({
          'si_mobile': mobileNumber,
          'si_pin': pin,
          'si_first_name': name
        }),
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        });
    print(registrationUrl);
    print(response.body);
    return response.body;
  }
}
