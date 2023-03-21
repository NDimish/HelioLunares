import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'; // for using tickets
import 'package:university_ticketing_system/backend_communication/models/University.dart';
import 'package:university_ticketing_system/pages/select_society/widgets/society_card.dart'; // for using university

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
          return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: DataP.collection.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: SocietyCard(
                            societyName: DataP.collection[index].society.name,
                            categoryName: DataP
                                .collection[index].societyCategory.categoryName,
                            onTap: () {
                              print(
                                  "ID is ${DataP.collection[index].societyCategory.id}");
                            }));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                ),
              ));
        });
  }
}
