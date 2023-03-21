//GENERATE LIST OF SOCIETIES
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/pages/select_society/data_loader.dart';

class SocietyListMaker extends StatelessWidget {
  const SocietyListMaker({super.key});

  Future<Widget> loadData() async {
    http.Response response = await createSociety(
        "nathgsg1@gmail.com",
        "This.is.pass1091",
        1,
        "NEWSOCIETY",
        '12/12/2002',
        "about us text",
        [1, 2, 3]);
    print(response.statusCode);

    //THIS IS CODE TO AUTHENTICATE
    http.Response newResponse =
        await auth("nathgsg1@gmail.com", "This.is.pass1091");

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
            return Padding(
                padding: EdgeInsets.fromLTRB(16, 60, 16, 10),
                child: Container(
                    //height: MediaQuery.of(context).size.height * 0.95,
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: snapshot.data!)));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
