import 'models/all.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class authenticate {
  late final bool result;

  bool get check {
    return check;
  }

  authenticate(String username, String password) {
    fetchData(username, password);
  }

  fetchData(String username, String password) async {
    final client = HttpClient();
    final request = await client.postUrl(Uri.parse('${DATASOURCE}log_in/'));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    request.write('{"email": "nath@gmail.com", "password": "q"}');
    final response = await request.close();

    if (response.statusCode == 200) {
      //Map<String, dynamic> cookies = json.decode(response.body);
      print(response.headers);

      //Cookies.eatCookies(cookies['token'], cookies['token'], cookies['email']);
      // print(Cookies.CSRFToken);
      // print(Cookies.Email);
      // print(Cookies.Cookie);
    } else {
      // print("fail");
    }
  }
}
