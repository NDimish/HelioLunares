import 'dart:io';

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
    print("Auth passed");
  } else {
    print("Auth failed");
  }
  print("ending auth");
  return response;
}

Future<http.Response> createSociety(
    String email,
    String password,
    int uniId,
    String socName,
    String creationDate,
    String aboutUs,
    List<int> categories) async {
  print("beginning create society");
  final response = await http.post(
    Uri.parse('${DATASOURCE}society/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'user': {'email': email, 'password': password},
      'university_society_is_at': uniId,
      'name': socName,
      'creation_date': creationDate,
      'about_us': aboutUs,
      'categories': categories
    }),
  );

  if (response.statusCode == 201) {
    print("Society created.");
  } else {
    print("Society not created.");
  }
  print("ending create society");
  return response;
}

Future<http.Response> createPerson(String email, String password, int uniId,
    String firstName, String lastName, String fieldStudy) async {
  print("beginning create person");
  final response = await http.post(
    Uri.parse('${DATASOURCE}users/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'user': {'email': email, 'password': password},
      'university_studying_at': uniId,
      'first_name': firstName,
      'last_name': lastName,
      'field_of_study': fieldStudy
    }),
  );

  if (response.statusCode == 201) {
    print("Person has been created.");
  } else {
    print("Person failed to be created.");
  }
  print("ending create person");
  return response;
}

Future<http.Response> logout() async {
  print("beginning logout");
  final response = await http.get(
    Uri.parse('${DATASOURCE}log_out/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          "token ${globals.localdataobj.getToken()}"
    },
  );

  if (response.statusCode == 200) {
    print("Logged out.");
    globals.localdataobj.setData("", "", 0, -1);
  } else {
    print("Not logged out.");
  }
  print("ending log out");
  return response;
}
