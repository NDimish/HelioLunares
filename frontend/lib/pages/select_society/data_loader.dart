import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

import 'package:university_ticketing_system/pages/select_society/widgets/society_card.dart';

import '../../backend_communication/models/Society.dart';
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

    var societyFilter = {
      "user_id": globals.localdataobj.getUserID().toString()
    };
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Society>(
                  ID: globals.localdataobj.getUserID())),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.SocietyRole>(
                  filter: powInSocietyFilter)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.SocietyCategories>(
                  filter: {}, order: orderBy))
        ],
        builder: (context, child) {
          final societyData =
              Provider.of<data.dataCollector<data.Society>>(context);
          final DataP =
              Provider.of<data.dataCollector<data.SocietyCategories>>(context);
          final roleData =
              Provider.of<data.dataCollector<data.SocietyRole>>(context);

          if (societyData.collection.isEmpty || DataP.collection.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: (globals.localdataobj.getUserLevel() == 3)
                    ? ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: societyData.collection.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: SocietyCard(
                                  societyName:
                                      societyData.collection[index].name,
                                  categoryName: DataP.collection[index]
                                      .societyCategory.categoryName,
                                  onTap: () {
                                    final Society society =
                                        Get.put(societyData.collection[index]);

                                    print(
                                        "ID is ${societyData.collection[index].id}");

                                    sideMenuController.setVisible();
                                    menuController.activeItem.value =
                                        societyHubPageDisplayName;
                                    sideMenuController.setVisible();
                                    navigationController.navigateToWArgs(
                                        societyHubPageDisplayName,
                                        societyData.collection[index]);
                                    sideMenuController.setVisible();
                                  }));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                      )
                    : Container(),
              ));
        });
  }
}
