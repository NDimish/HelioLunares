import 'package:get/get.dart';

class CounterController extends GetxController {
  //use observable to know when this value changes
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}
