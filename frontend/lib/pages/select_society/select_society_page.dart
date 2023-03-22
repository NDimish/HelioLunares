//GENERATE LIST OF SOCIETIES
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/pages/select_society/data_loader.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widgets/custom_text.dart';

class SelectSocietyPage extends StatelessWidget {
  const SelectSocietyPage({super.key});

  Future<Widget> loadData() async {
    http.Response response = await createSociety(
        "nathg@gmail.com",
        "This.is.pass1091",
        1,
        "NEWSOCIETY",
        '12/12/2002',
        "about us text",
        [1, 2, 3]);
    print(response.statusCode);

    //THIS IS CODE TO AUTHENTICATE
    http.Response newResponse =
        await auth("nathg@gmail.com", "This.is.pass1091");

    if (newResponse.statusCode == HttpStatus.ok) {
      "Print start dataloader";
      return DataLoader();
    } else {
      print("NO");
    }
    return const Text("Auth failed");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: loadData(),
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: ResponsiveWidget.isSmallScreen(context)
                                        ? 56
                                        : 6),
                                child: CustomText(
                                  text: menuController.activeItem.value,
                                  size: ResponsiveWidget.isSmallScreen(context)
                                      ? 24
                                      : 40,
                                  weight: FontWeight.bold,
                                ),
                              )
                            ],
                          )),
                      MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Expanded(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: snapshot.data!)))
                    ]));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
