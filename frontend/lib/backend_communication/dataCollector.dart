import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
export '../models/all.dart';
import '../models/all.dart';

final Map<Type, Databases> sets = {
  User: Databases.users,
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
    fetchData(
        createUrl(sets[T]!, filter: filter, order: order, ID: ID), sets[T]!);
  }

  String createUrl(Databases Database,
      {String filter = 'none',
      OrderType order = OrderType.CHRONOLOGICAL,
      int ID = -1}) {
    String url = 'http://127.0.0.1:8000/${Database.name}/';

    // if (ID >= 0) {
    //   url += '$ID/';
    // } else {
    //   url += '$filter/${order.index}/';
    // }
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
      case Databases.usersadd:
        return User.fromJson(json);
      case Databases.event:
        return Event.fromJson(json);

      default:
        return User.fromJson(json);
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
