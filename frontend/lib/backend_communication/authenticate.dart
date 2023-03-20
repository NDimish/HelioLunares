import 'models/all.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/globals.dart' as globals;

Future<http.Response> auth(String username, String password) async {
  print("beginning auth");
  final response = await http.post(
    Uri.parse('${DATASOURCE}log_in/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    globals.localdataobj.setData(
        data['token'], data['email'], data['user_level'], data['user_id']);
  } else {
    print("Auth failed");
  }
  print("ending auth");
  return response;
}
