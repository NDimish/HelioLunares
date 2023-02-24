import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_form_field.dart';
import 'package:university_ticketing_system/screens/home_screen.dart';
import '../backend_communication/get.dart' as data;

class testscreen extends StatefulWidget {
  const testscreen({super.key});

  @override
  State<testscreen> createState() => _testscreen();
}

class _testscreen extends State<testscreen> {
  late Future<data.Login> future;

  @override
  void initState() {
    super.initState();
    future = data.dataCollector().Collection(data.Databases.users);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: ListView.builder(
        shrinkWrap: true,
        itemCount: future.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    todoP.deleteTodo(todoP.todos[index]);
                  }),
              title: Text(
                todoP.todos[index].title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              

            },
          ),
        ),
      ),
  }
}
