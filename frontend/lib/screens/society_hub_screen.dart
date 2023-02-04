import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/controllers/counterController.dart';
import 'package:university_ticketing_system/screens/other.dart';

class SocietyHubScreen extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Clicks: ${counterController.counter.value}')),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(OtherScreen());
                    },
                    child: Text('Open other screen ')),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
