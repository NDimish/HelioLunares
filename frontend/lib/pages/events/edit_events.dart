import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_form.dart';
import 'package:university_ticketing_system/pages/events/widgets/society_events.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../constants/style.dart';
import '../../models/society_event.dart';
import '../society_hub/widgets/circular_card.dart';

class EditSocietyEventsPage extends StatelessWidget {
  SocietyEvent obj = Get.find<SocietyEvent>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 16.0),
        child: EventForm());
  }
}
