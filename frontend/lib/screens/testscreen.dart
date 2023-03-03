import 'package:flutter/material.dart';
import '../backend_communication/get.dart' as data;
import 'package:provider/provider.dart';

class testscreen extends StatefulWidget {
  final data.OrderType Orderby;
  final String filter;

  const testscreen(
      {Key? key,
      this.Orderby = data.OrderType.CHRONOLOGICAL,
      this.filter = 'none'})
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
    return ChangeNotifierProvider(
        create: (context) => data.dataCollector<data.Login>(
            filter: widget.filter, order: widget.Orderby),
        builder: (context, child) {
          final DataP = Provider.of<data.dataCollector<data.Login>>(context);
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
                          // todoP.deleteTodo(todoP.todos[index]);
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
                onPressed: () {}),
          );
        });
  }
}
