import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import '../../../backend_communication/models/Event.dart';
import '../../../widgets/circle_icon.dart';
import '../../../widgets/custom_text.dart';

const String _heroAddTodo = 'add-todo-hero';

class AddEventPopupCard extends StatelessWidget {
  //All event details to display
  final Event event = Get.find<Event>();
  // final dataCollector<Event> eventDataProvider =
  //     Get.find<dataCollector<Event>>();
  // final List<Event> eventList =
  AddEventPopupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          child: Material(
            color: MyColours.veryLightGrey, //AppColors.accentColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: event.title,
                            size: 30,
                            weight: FontWeight.bold,
                            colour: MyColours.active,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ignore: prefer_const_constructors
                              CircleIcon(
                                  icon: const Icon(
                                Icons.payments_outlined,
                                color: MyColours.active,
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: "£${event.price}",
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ignore: prefer_const_constructors
                              CircleIcon(
                                  icon: Icon(
                                Icons.date_range,
                                color: MyColours.active,
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: event.date,
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleIcon(
                                  icon: const Icon(
                                Icons.location_on_outlined,
                                color: MyColours.active,
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: CustomText(
                                text: event.venue,
                                size: 18,
                                weight: FontWeight.bold,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleIcon(
                                  icon: const Icon(
                                Icons.timer,
                                color: MyColours.active,
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: "${event.duration} mins",
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleIcon(
                                  icon: const Icon(
                                Icons.description,
                                color: MyColours.active,
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                child: CustomText(
                                  text: event.description,
                                  size: 16,
                                  weight: FontWeight.bold,
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.all(10)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: MyColours.light)),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColours.light),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  MyColours.panelBackgroundColour),
                            ),
                            onPressed: () {
                              Get.put(event);
                              navigationController
                                  .navigateTo(editEventDetailsPageDisplayName);
                            },
                            child: const CustomText(
                              colour: MyColours.active,
                              text: "Edit",
                              size: 24,
                              weight: FontWeight.bold,
                            ),
                          )
                        ]))),
          ),
        ),
      ),
    );
  }
}
