import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/models/University.dart';
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart';
import 'dart:convert';
export 'models/all.dart';
import 'models/all.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

final Map<Type, Databases> sets = {
  User: Databases.users,
  Event: Databases.event,
  People: Databases.people,
  Society: Databases.society,
  Tickets: Databases.tickets,
  University: Databases.university,
  SocietyRole: Databases.societyrole
};

enum PostType { READ, ADD, DELETE, UPDATE }

//abstract to use in places

class dataCollector<T extends dataSets> with ChangeNotifier {
  List<T> output = [];

  List<T> get collection {
    return [...output];
  }

  dataCollector(
      {Map<String, String> filter = const {},
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1}) {
    fetchData(
        createUrl(sets[T]!, filter: filter, order: order, ID: ID), sets[T]!);
  }

  String createUrl(Databases Database,
      {Map<String, String> filter = const {},
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1,
      PostType postType = PostType.READ}) {
    String url = '$DATASOURCE${Database.name}/';

    if (ID >= 0) {
      url = '$url${ID}/';
    } else {
      if (postType == PostType.READ) {
        url = '$url?ordering=id';
        filter.forEach((key, value) {
          url = '$url&$key=$value';
        });
      }
    }

    // print(url);
    return '$url?format=json';
  }

  fetchData(String url, Databases Database) async {
    print("This is loading data.");
    print(globals.localdataobj.getToken());
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader:
          "token ${globals.localdataobj.getToken()}"
    });
    if (response.statusCode == 200) {
      // print(response.body);
      var data = json.decode(response.body) as List;
      output = data.map<T>((json) => (getClass(json, Database))).toList();
      notifyListeners();
    }
    // print(response.body);
    print(globals.localdataobj.getToken());
  }

  getClass(Map<String, dynamic> json, Databases database) {
    switch (database) {
      case Databases.people:
        return People.fromJson(json);
      case Databases.event:
        return Event.fromJson(json);
      case Databases.university:
        return University.fromJson(json);
      case Databases.society:
        return Society.fromJson(json);
      case Databases.tickets:
        return Tickets.fromJson(json);
      case Databases.societyrole:
        return SocietyRole.fromJson(json);

      default:
        return User.fromJson(json);
    }
  }

  Future<bool> addToCollection(T task) async {
    final response = await http.post(
      Uri.parse(createUrl(sets[T]!, postType: PostType.ADD)),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            "token ${globals.localdataobj.getToken()}"
        //HttpHeaders.authorizationHeader: Cookies.CSRFToken
      },
      body: json.encode(task),
    );
    if (response.statusCode == 201) {
      collection.add(task);
      return true;
    }
    return false;
  }

  Future<bool> deleteFromCollection(T task) async {
    final response = await http.delete(
      Uri.parse(createUrl(sets[T]!, postType: PostType.DELETE, ID: task.id)),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            "token ${globals.localdataobj.getToken()}"
        // HttpHeaders.authorizationHeader: Cookies.CSRFToken
      },
    );
    if (response.statusCode == 204) {
      collection.remove(task);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> updateCollection(T task) async {
    final response = await http.put(
      Uri.parse(createUrl(sets[T]!, postType: PostType.UPDATE)),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            "token ${globals.localdataobj.getToken()}"
        //HttpHeaders.authorizationHeader: Cookies.CSRFToken
      },
      body: json.encode(task),
    );
    if (response.statusCode == 201) {
      notifyListeners();
      return true;
    }
    return false;
  }

  getRelation(Relatiions relations, int id) {
    switch (relations) {
      case Relatiions.HOSTS:
        return id;

      default:
    }
  }
}
