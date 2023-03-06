import '../models/all.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class authenticate {
  late final bool result;

  bool get check {
    return check;
  }

  authenticate(String username, String password) {
    fetchData(username, password);
  }

  fetchData(String username, String password) async {
    final response = await http.post(Uri.parse('${DATASOURCE}log_in/'),
        body: {"email": username, "password": password});
    if (response.statusCode == 200) {
      Map<String, dynamic> cookies = json.decode(response.body);

      Cookies.eatCookies(cookies['token'], cookies['token'], cookies['email']);
      // print(Cookies.CSRFToken);
      // print(Cookies.Email);
      // print(Cookies.Cookie);
    } else {
      // print("fail");
    }
  }
}
