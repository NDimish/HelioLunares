import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//enumerations

enum Databases {
  users,
  event,
}

enum Tag {
  E,
}

enum OrderType {
  CHRONOLOGICAL,
}

final Map<Type, Databases> sets = {
  Login: Databases.users,
  Event: Databases.event
};

//abstract to use in places

class dataCollector<T extends dataSets> with ChangeNotifier {
  List<T> output = [];

  List<T> get collection {
    return [...output];
  }

  dataCollector(
      {String filter = 'none',
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1}) {
    collections(sets[T]!, filter: filter, order: order, ID: ID);
  }

  collections(Databases Database,
      {String filter = 'none',
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1}) {
    return fetchData(
        createUrl(Database, filter: filter, order: order, ID: ID), Database);
  }

  String createUrl(Databases Database,
      {String filter = '',
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1}) {
    String url = 'http://127.0.0.1:8000/${Database.name}/';

    if (ID >= 0) {
      url += '$ID/';
    } else {
      url += '$filter/${order.index}/';
    }
    print(url);
    return '$url?format=json';
  }

  fetchData(String url, Databases Database) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      output = data.map<T>((json) => (getClass(json, Database))).toList();
      notifyListeners();
    }
  }

  getClass(Map<String, dynamic> json, Databases database) {
    switch (database) {
      case Databases.users:
        return Login.fromJson(json);
      case Databases.event:
        return Event.fromJson(json);

      default:
        return Login.fromJson(json);
    }
  }

  static String generateFilterSet(List<String> filters) {
    var i = 0;
    String output = '';
    while (i < filters.length) {
      output = '$output|${filters[i]}';
      i++;
    }
    return output;
  }
}

// Classes for models

abstract class dataSets {
  dataSets() {}

  Databases getDatabase() {
    return Databases.users;
  }
}

class Login extends dataSets {
  final int id;
  final String username;
  // final String password;

  Login({required this.id, required this.username});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(id: json['id'], username: json['email']);
  }

  String getUsername() {
    return username;
  }

  @override
  Databases getDatabase() {
    return Databases.users;
  }
}

class Event extends dataSets {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String description;
  // final String password;

  Event(
      {required this.title,
      required this.date,
      required this.time,
      required this.venue,
      required this.description});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        title: json['event_name'],
        date: (json['event_date'].split('T')[0]),
        time: (json['event_date'].split('T')[1]),
        venue: json['location'],
        description: json['description']);
  }

  @override
  Databases getDatabase() {
    return Databases.event;
  }
}
