import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'; // for using tickets
import 'package:university_ticketing_system/backend_communication/models/University.dart';
import 'package:university_ticketing_system/helpers/local_navigator.dart';
import 'package:university_ticketing_system/pages/select_society/widgets/society_card.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/widgets/layout.dart';

import '../../routing/routes.dart'; // for using university

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
    var powInSocietyFilter = {
      'role__gt': '1',
      'user_at_society': globals.localdataobj.getUserID().toString()
    };
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  data.dataCollector<data.Society>(filter: powInSocietyFilter)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.SocietyCategories>(
                  filter: {}, order: orderBy))
        ],
        builder: (context, child) {
          final DataP =
              Provider.of<data.dataCollector<data.SocietyCategories>>(context);

          return Container(
              height: MediaQuery.of(context).size.height * 0.95,
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
                              //Get the selected society
                              //DataP.collection[index];

                              menuController.activeItem.value =
                                  societyHubPageDisplayName;
                              navigationController.navigateToWArgs(
                                  societyHubPageDisplayName,
                                  DataP.collection[index].society);
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
