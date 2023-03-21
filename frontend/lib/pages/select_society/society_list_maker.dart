//GENERATE LIST OF SOCIETIES
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'; // for using tickets
import 'package:university_ticketing_system/backend_communication/models/University.dart';
import 'package:university_ticketing_system/pages/select_society/data_loader.dart';

import '../../widgets/custom_text.dart'; // for using university

class SocietyListMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
        child: (Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  //height: MediaQuery.of(context).size.height * 0.95,
                  child: globals.localdataobj.getToken() != ""
                      ? MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Expanded(child: DataLoader()))
                      : CustomText(text: "Not authenticated yet")),
              TextButton(
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: () async {
                    //THIS IS CODE TO CREATE SOCIETY

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
                    http.Response new_response =
                        await auth("nathgsg1@gmail.com", "This.is.pass1091");
                    Navigator.pushNamed(context, '/');
                    // DataP.addToCollection(data.User(
                    //     id: 3,
                    //     email: "wqeqwe@gmail.com",
                    //     date_joined: "2-3-3003t23:12",
                    //     userType: data.UserType.STUDENT));
                  }),
            ])));
  }
}
