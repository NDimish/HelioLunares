import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/pages/edit_mode/edit_mode.dart';
import 'package:university_ticketing_system/pages/edit_mode/edit_society_hub.dart';
import 'package:university_ticketing_system/pages/events/edit_events.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_details_popup_card.dart';
import 'package:university_ticketing_system/pages/statistics/statistics.dart';
import 'package:university_ticketing_system/pages/events/events.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/routing/routes.dart';

import '../pages/society_members/society_members.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Get.routing.args = settings.arguments;
  switch (settings.name) {
    case societyHubPageDisplayName:
      return _getPageRoute(const SocietyHubPage());
    case societyEventsPageDisplayName:
      return _getPageRoute(const SocietyEventsPage());
    case statisticsPageDisplayName:
      return _getPageRoute(const StatisticsPage());
    case editModePageDisplayName:
      return _getPageRoute(const EditModePage());
    case eventDetailsPageDisplayName:
      return EventDetailsRoute(
          builder: ((context) => AddEventPopupCard()), settings: settings);
    case editEventDetailsPageDisplayName:
      return _getPageRoute(EditSocietyEventsPage());
    case editSocietyHubPageDisplayName:
      return _getPageRoute(const EditSocietyHubPage());
    case editSocietyMembersPageDisplayName:
      return _getPageRoute(const SocietyMembersPage());
    default:
      return _getPageRoute(const SocietyHubPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: ((context) => child));
}
