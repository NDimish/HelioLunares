import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/models/society_event.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_card.dart';
import '../../../widgets/custom_text.dart';
import 'society_events.dart';

const String _heroAddTodo = 'add-todo-hero';

class AddEventPopupCard extends StatelessWidget {
  //All event details to display
  String name = Get.find<SocietyEvent>().name;
  String price = Get.find<SocietyEvent>().price;
  String date = Get.find<SocietyEvent>().date;
  String location = Get.find<SocietyEvent>().location;
  String duration = Get.find<SocietyEvent>().duration;
  String description = Get.find<SocietyEvent>().description;
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: name,
                            size: 20,
                            weight: FontWeight.bold,
                            colour: MyColours.active,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.payments_outlined,
                                color: MyColours.active,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              CustomText(
                                text: price,
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.date_range,
                                color: MyColours.active,
                              ),
                              CustomText(
                                text: date,
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: MyColours.active,
                              ),
                              CustomText(
                                text: location,
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer,
                                color: MyColours.active,
                              ),
                              CustomText(
                                text: duration,
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.description,
                                color: MyColours.active,
                              ),
                              Flexible(
                                  child: CustomText(
                                text: description,
                                size: 16,
                                weight: FontWeight.bold,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: MyColours.light)),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColours.light),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  MyColours.dark),
                            ),
                            onPressed: () {},
                            child: CustomText(
                              text: "Edit",
                              size: 18,
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
