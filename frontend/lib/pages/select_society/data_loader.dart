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

class DataLoader extends StatefulWidget {
  const DataLoader({super.key});

  @override
  State<StatefulWidget> createState() => _DataLoaderState();
}

class _DataLoaderState extends State<DataLoader> {
  final data.OrderType orderBy;

  final Map<String, String> filter;
  final int id;

  _DataLoaderState(
      {Key? key,
      this.orderBy = data.OrderType.CHRONOLOGICAL,
      this.filter = const {},
      this.id = -9});

  @override
  Widget build(BuildContext context) {
    var powInSocietyFilter = {
      'role__gt': '1',
      'user_at_society': globals.localdataobj.getUserID().toString()
    };

    var societyFilter = {};
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  data.dataCollector<data.Society>(filter: {})),
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
                              final Society society =
                                  Get.put(DataP.collection[index].society);

                              print(
                                  "ID is ${DataP.collection[index].society.user.id}");

                              sideMenuController.setVisible();
                              menuController.activeItem.value =
                                  societyHubPageDisplayName;
                              sideMenuController.setVisible();
                              navigationController
                                  .navigateTo(societyHubPageDisplayName);
                              sideMenuController.setVisible();
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
