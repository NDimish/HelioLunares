import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/local_navigator.dart';
import 'package:university_ticketing_system/pages/events/events.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/widgets/layout.dart';

import '../../../backend_communication/dataCollector.dart';
import '../../../backend_communication/models/Event.dart';
import '../../../widgets/custom_text.dart';

class DeleteEventConfirmation extends StatelessWidget {
  final Event event;

  const DeleteEventConfirmation({super.key, required this.event});

  showAlertDialog(BuildContext context) {
    Widget okButton = MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => dataCollector<Event>(filter: {})),
        ],
        builder: (context, child) {
          dataCollector<Event> eventDataProvider =
              Provider.of<dataCollector<Event>>(context);
          return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black.withOpacity(0.7))),
            key: const Key("OKButton"),
            child: CustomText(
              text: "OK",
              colour: Colors.white,
            ),
            onPressed: () {
              //DELETE SELECTED EVENT
              Event event = Get.find<Event>();
              eventDataProvider.deleteFromCollection(event);

              print(event.title);
              print("Event deleted");
              Navigator.of(context, rootNavigator: true).pop();

              navigationController.navigateTo(societyEventsPageDisplayName);
            },
          );
        });
    Widget cancelButton = ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.7))),
      key: const Key("CancelButton"),
      child: const CustomText(
        text: "Cancel",
        colour: Colors.white,
      ),
      onPressed: () {
        //Close the dialog box
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: CustomText(
        text: "Delete Event",
        weight: FontWeight.bold,
        colour: Colors.red,
        size: 20,
      ),
      content:
          const CustomText(text: "Are you sure you want to delete this event?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    //return alert;
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
