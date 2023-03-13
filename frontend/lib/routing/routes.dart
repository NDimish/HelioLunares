import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';

const rootRoute = "/";

const societyHubPageDisplayName = "Profile";
const societyHubPageRoute = "/society_hub";

const societyEventsPageDisplayName = "Events";
const societyEventsPageRoute = "/society_events";

const statisticsPageDisplayName = "Statistics";
const statisticsPageRoute = "/statistics";

const editModePageDisplayName = "Edit Page";
const editModePageRoute = "/edit_mode";

//event subpage
const eventDetailsPageDisplayName = "Event Details";
const eventDetailsPageRoute = "/AddEventPopupCard";

//edit event details page
const editEventDetailsPageDisplayName = "Edit Details";
const editEventDetailsPageRoute = "/EditEventDetails";

//add event page
const addEventPageDisplayName = "Add Event";
const addEventPageRoute = "/AddEvent";

//edit society hub page
const editSocietyHubPageDisplayName = "Edit Society Hub Page";
const editSocietyHubPageRoute = "/EditSocietyHub";

//edit society members page
const editSocietyMembersPageDisplayName = "Members";
const editSocietyMembersPageRoute = "/EditSocietyMembers";

class EventDetailsRoute<T> extends PageRoute<T> {
  EventDetailsRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => MyColours.backgroundColour.withOpacity(0.5);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(societyHubPageDisplayName, societyHubPageRoute),
  MenuItem(societyEventsPageDisplayName, societyEventsPageRoute),
  MenuItem(statisticsPageDisplayName, statisticsPageRoute),
  MenuItem(editModePageDisplayName, editModePageRoute),
  MenuItem(editSocietyMembersPageDisplayName, editSocietyMembersPageRoute)
];
