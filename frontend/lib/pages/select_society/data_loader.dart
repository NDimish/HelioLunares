import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'; // for using tickets
import 'package:university_ticketing_system/backend_communication/models/University.dart'; // for using university

class DataLoader extends StatelessWidget {
  final data.OrderType orderBy;
  final Map<String, String> filter;
  final int id;

  const DataLoader(
      {Key? key,
      this.orderBy = data.OrderType.CHRONOLOGICAL,
      this.filter = const {},
      this.id = -1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(
          //     create: (context) => data.dataCollector<data.Event>(
          //         filter: widget.filter, order: widget.orderBy)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.SocietyCategories>(
                  filter: filter, order: orderBy)),
        ],
        builder: (context, child) {
          // final DataP2 = Provider.of<data.dataCollector<data.Event>>(context);
          final DataP =
              Provider.of<data.dataCollector<data.SocietyCategories>>(context);
          return Scaffold(
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: DataP.collection.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          DataP.deleteFromCollection(DataP.collection[index]);
                        }),
                    title: Text(
                      DataP.collection[index].society.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DataP.collection[index].societyCategory.categoryName,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ));
              },
            ),
          );
        });
  }
}
