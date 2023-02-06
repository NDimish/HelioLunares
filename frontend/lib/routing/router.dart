import 'dart:io';

import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/edit_mode/edit_mode.dart';
import 'package:university_ticketing_system/pages/statistics/statistics.dart';
import 'package:university_ticketing_system/pages/events/events.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case societyHubPageDisplayName:
      return _getPageRoute(SocietyHubPage());
    case societyEventsPageDisplayName:
      return _getPageRoute(SocietyEventsPage());
    case statisticsPageDisplayName:
      return _getPageRoute(StatisticsPage());
    case editModePageDisplayName:
      return _getPageRoute(EditModePage());
    default:
      return _getPageRoute(SocietyHubPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: ((context) => child));
}
