import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/pages/edit_mode/edit_mode.dart';
import 'package:university_ticketing_system/pages/events/add_events.dart';
import 'package:university_ticketing_system/pages/events/edit_events.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_details_popup_card.dart';
import 'package:university_ticketing_system/pages/select_society/select_society_page.dart';
import 'package:university_ticketing_system/pages/statistics/statistics.dart';
import 'package:university_ticketing_system/pages/events/events.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/society_settings/society_settings_page.dart';
import '../backend_communication/models/Society.dart';
import '../pages/society_members/society_members.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  late Widget page;
  Get.routing.args = settings.arguments;
  switch (settings.name) {
    case societyHubPageDisplayName:
      final args = settings.arguments as Society;
      return _getPageRoute(SocietyHubPage(society: args), societyHubPageRoute);
    case societyEventsPageDisplayName:
      return _getPageRoute(const SocietyEventsPage(), societyEventsPageRoute);
    case statisticsPageDisplayName:
      return _getPageRoute(const StatisticsPage(), statisticsPageRoute);
    case editModePageDisplayName:
      return _getPageRoute(const EditModePage(), editModePageRoute);
    case eventDetailsPageDisplayName:
      return EventDetailsRoute(
          builder: ((context) => AddEventPopupCard()),
          settings: RouteSettings(name: eventDetailsPageRoute));
    case editEventDetailsPageDisplayName:
      return _getPageRoute(EditSocietyEventsPage(), editEventDetailsPageRoute);
    case addEventPageDisplayName:
      return _getPageRoute(AddSocietyEventsPage(), addEventPageRoute);
    case editSocietyMembersPageDisplayName:
      return _getPageRoute(
          const SocietyMembersPage(), editSocietyMembersPageRoute);
    case societySettingsPageDisplayName:
      return _getPageRoute(
          const SocietySettingsPage(), societySettingsPageRoute);
    case selectSocietyPageDisplayName:
      return _getPageRoute(SelectSocietyPage(), selectSocietyPageRoute);

    default:
      return _getPageRoute(SelectSocietyPage(), selectSocietyPageRoute);
  }
}

PageRoute _getPageRoute(Widget child, String route) {
  return MaterialPageRoute(
      builder: ((context) => child),
      settings: RouteSettings(name: "/societyhub$route"));
}
