import 'package:get/get.dart';
import 'models/all.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:university_ticketing_system/globals.dart' as globals;

class authenticate {
  late final bool result;

  bool get check {
    return check;
  }

  authenticate(String username, String password) {
    fetchData(username, password);
  }

  fetchData(String username, String password) async {
    // final client = HttpClient();
    // final request = await client.postUrl(Uri.parse('${DATASOURCE}log_in/'));
    // request.headers
    //     .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    // request.write('{"email": "${username}", "password": "${password}"}');
    // final response = await request.close();
    print("beginning auth");
    final response = await http.post(
      Uri.parse('${DATASOURCE}log_in/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'email': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      //print(response.headers);
      globals.localdataobj.setData(data['token'], data['email']);
      // x.setData(data['token'], data['email']);
      // print(x.Token);
      // print(response.body);
    } else {
      print(response.body);
    }
    print("end auth");
    print(globals.localdataobj.getToken());
  }
}
