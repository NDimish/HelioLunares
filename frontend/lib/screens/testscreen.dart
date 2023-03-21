import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/societyfunctions.dart';
import '../backend_communication/authenticate.dart';
import '../backend_communication/dataCollector.dart' as data;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/globals.dart' as globals;
import 'dart:convert';
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'; // for using tickets
import 'package:university_ticketing_system/backend_communication/models/University.dart'; // for using university

class testscreen extends StatefulWidget {
  const testscreen({Key? key});

  @override
  State<testscreen> createState() => _testscreen();
}

class _testscreen extends State<testscreen> {
  // late Future<data.Login> future;

  //  @override
  //  void initState() {
  //    super.initState();
  //   future = data.dataCollector().Collection(data.Databases.users);
  //  }

  // // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: globals.localdataobj.getToken() != ""
          ? TestScreenAddition()
          : Text("Not authenticated yet"),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () async {
            //THIS IS CODE TO CREATE SOCIETY

            // http.Response response = await createSociety(
            //     "nathgsg@gmail.com",
            //     "This.is.pass1091",
            //     1,
            //     "socname",
            //     '12/12/2002',
            //     "about us text",
            //     [1, 2, 3]);
            // print(response.statusCode);

            //THIS IS CODE TO CREATE A PERSON

            // http.Response response_two = await createPerson(
            //     "thisisanewemail@gmail.com",
            //     "This.is.pass1091",
            //     1,
            //     "Water",
            //     "Rock",
            //     "Tester");
            // print(response.statusCode);

            //THIS IS CODE TO AUTHENTICATE
            //LOgs in as society account
            // http.Response new_response =
            //     await auth("thisisanewemail@gmail.com", "This.is.pass1091");

            //make person join society
            // print(json.decode(response.body)['user']['id']);
            // http.Response join_response =
            //     await joinSociety(json.decode(response.body)['user']['id']);

            // //login as society account
            // http.Response person_response =
            //     await auth("nathgsg@gmail.com", "This.is.pass1091");

            // //promote person user in society
            // http.Response promote_role = await updateSociety(
            //     json.decode(response_two.body)['user']['id'], 2);

            //login as person
            http.Response log_in_as_perosn =
                await auth("thisisanewemail@gmail.com", "This.is.pass1091");

            Navigator.pushNamed(context, '/societyhub');
          }),
    );
  }
}

//THIS IS TO LOAD DATA
class TestScreenAddition extends StatefulWidget {
  final data.OrderType orderBy;
  final Map<String, String> filter;
  final int id;

  const TestScreenAddition(
      {Key? key,
      this.orderBy = data.OrderType.CHRONOLOGICAL,
      this.filter = const {},
      this.id = -1})
      : super(key: key);

  @override
  State<TestScreenAddition> createState() => _TestScreenAdditionState();
}

class _TestScreenAdditionState extends State<TestScreenAddition> {
  @override
  Widget build(BuildContext context) {
    var powerInSocFilter = {
      'role__gt': '1',
      'user_at_society': globals.localdataobj.getUserID().toString()
    };
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(
          //     create: (context) => data.dataCollector<data.Event>(
          //         filter: widget.filter, order: widget.orderBy)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.SocietyRole>(
                  filter: powerInSocFilter, order: widget.orderBy)),
        ],
        builder: (context, child) {
          // final DataP2 = Provider.of<data.dataCollector<data.Event>>(context);
          final DataP =
              Provider.of<data.dataCollector<data.SocietyRole>>(context);
          if (DataP.responserFromUrL.statusCode == 200) {
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DataP.collection[index].role.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ));
                },
              ),
            );
          } else {
            return Text(DataP.responserFromUrL.statusCode.toString());
          }
        });
  }
}
