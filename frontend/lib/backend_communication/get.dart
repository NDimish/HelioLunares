import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//enumerations

enum Databases {
  users,
}

enum Tag {
  E,
}

enum OrderType {
  CHRONOLOGICAL,
}

//abstract to use in places

class dataCollector {
  dataCollector() {}

  String createUrl(Databases Database,
      {String filter = '',
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1}) {
    String url = 'http://127.0.0.1:8000/${Database.name}/';

    if (ID <= 0) {
      url += '$ID/';
    } else {
      url += '$filter/${order.name}/';
    }

    return '$url?format=json';
  }

  fetchData(String url, Databases Database) async {
    List Output = [];
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      Output = data.map<Login>((json) => (Login.fromJson(json))).toList();
    }
  }

  Collection(Databases Database,
      {String filter = '',
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1}) {
    return fetchData(
        createUrl(Database, filter: filter, order: order, ID: ID), Database);
  }

  Type getClass(Databases database) {
    switch (database) {
      case Databases.users:
        return Login;

      default:
        return Login;
    }
  }
}

// Classes for models

abstract class types {}

class Login extends types {
  final int id;
  final String username;
  final String password;

  Login({required this.id, required this.username, required this.password});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
        id: json['id'], username: json['username'], password: json['password']);
  }

  String getUsername() {
    return username;
  }
}
