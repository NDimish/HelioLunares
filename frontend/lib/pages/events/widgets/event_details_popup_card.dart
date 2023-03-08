import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/models/society_event.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import '../../../widgets/custom_text.dart';

const String _heroAddTodo = 'add-todo-hero';

class AddEventPopupCard extends StatelessWidget {
  //All event details to display
  SocietyEvent obj = Get.find<SocietyEvent>();
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
                            text: obj.name,
                            size: 20,
                            weight: FontWeight.bold,
                            colour: MyColours.active,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.payments_outlined,
                                color: MyColours.active,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              CustomText(
                                text: "£${obj.price}",
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.date_range,
                                color: MyColours.active,
                              ),
                              CustomText(
                                text: obj.date,
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: MyColours.active,
                              ),
                              CustomText(
                                text: obj.location,
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.timer,
                                color: MyColours.active,
                              ),
                              CustomText(
                                text: "${obj.duration} mins",
                                size: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.description,
                                color: MyColours.active,
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                child: CustomText(
                                  text: obj.description,
                                  size: 16,
                                  weight: FontWeight.bold,
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            style: ButtonStyle(
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
                              Get.put(obj);
                              navigationController
                                  .navigateTo(editEventDetailsPageDisplayName);
                            },
                            child: const CustomText(
                              text: "Edit",
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ]))),
          ),
        ),
      ),
    );
  }
}
