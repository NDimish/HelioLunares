import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

var token = "";

class TestScreenTwo extends StatelessWidget {
  const TestScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: FloatingActionButton(onPressed: () async {
          final response = await http.post(
              Uri.parse('http://localhost:8000/university/'),
              headers: {
                HttpHeaders.contentTypeHeader:
                    "application/json; charset=UTF-8",
                HttpHeaders.authorizationHeader: "token $token",
              },
              body:
                  '{"name":"testuni","latitude":"23.3","longitude":"23.33","street_name":"test street", "postcode":"TES 1ST"}');
          print(response);
          print(response.headers);
          print(response.body);
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final response = await http.post(
            Uri.parse('http://localhost:8000/log_in/'),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8"
            },
            body: '{"email":"admin@example.com","password":"password123"}');
        print(response.body);
        token = jsonDecode(response.body)["token"];
        print(response.body);
      }),
    );
  }
}
