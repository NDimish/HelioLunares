import 'package:flutter/material.dart';
import '../backend_communication/authenticate.dart';
import '../backend_communication/dataCollector.dart' as data;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class testscreen extends StatefulWidget {
  final data.OrderType Orderby;
  final Map<String, String> filter;
  final int id;

  const testscreen(
      {Key? key,
      this.Orderby = data.OrderType.CHRONOLOGICAL,
      this.filter = const {},
      this.id = -1})
      : super(key: key);

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Event>(
                  filter: widget.filter, order: widget.Orderby)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.User>(
                  filter: widget.filter, order: widget.Orderby)),
        ],
        builder: (context, child) {
          final DataP2 = Provider.of<data.dataCollector<data.Event>>(context);
          final DataP = Provider.of<data.dataCollector<data.User>>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Todo App'),
            ),
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
                      DataP.collection[index].email,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DataP.collection[index].userType.toString(),
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ));
              },
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                onPressed: () async {
                  http.Response response = await createSociety(
                      "nathgsg@gmail.com",
                      "This.is.pass1091",
                      1,
                      "socname",
                      '12/12/2002',
                      "about us text",
                      [1, 2, 3]);
                  print(response.statusCode);
                  http.Response new_response =
                      await auth("nathgsg@gmail.com", "This.is.pass1091");
                  Navigator.pushNamed(context, '/');
                  // DataP.addToCollection(data.User(
                  //     id: 3,
                  //     email: "wqeqwe@gmail.com",
                  //     date_joined: "2-3-3003t23:12",
                  //     userType: data.UserType.STUDENT));
                }),
          );
        });
  }
}
