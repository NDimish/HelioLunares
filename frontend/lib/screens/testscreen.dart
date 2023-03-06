import 'package:flutter/material.dart';
import '../backend_communication/dataCollector.dart' as data;
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
                      DataP.collection[index].username,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DataP.collection[index].id.toString(),
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ));
              },
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                onPressed: () {
                  DataP.addToCollection(
                      data.User(id: 3, username: "ro3eeeeeeew2rll@gmail.com"));
                }),
          );
        });
  }
}
