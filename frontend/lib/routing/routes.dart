import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';

const rootRoute = "/";

const societyHubPageDisplayName = "Profile";
const societyHubPageRoute = "/societyhub/";

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

//edit society members page
const editSocietyMembersPageDisplayName = "Members";
const editSocietyMembersPageRoute = "/EditSocietyMembers";

//society settings page
const societySettingsPageDisplayName = "Settings";
const societySettingsPageRoute = "/SocietySettings";

//society selection page
const selectSocietyPageDisplayName = "Select Society";
const selectSocietyPageRoute = "/SelectSociety";

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
  bool? isHidden;

  MenuItem(this.name, this.route, this.isHidden);

  void setIsHidden(bool x) {
    isHidden = x;
  }
}

class MenuItemRoutes {
  List<MenuItem> itemList;

  MenuItemRoutes(this.itemList);

  setHiddenItem(String itemName, bool isHidden) {
    Map<String, MenuItem> map =
        Map.fromIterable(itemList, key: (e) => e.name, value: (e) => e);
    if (map.containsKey(itemName)) {
      itemList.elementAt(2).setIsHidden(isHidden);
    }
  }
}

// MenuItemRoutes sideMenuItemRoutes = MenuItemRoutes([MenuItem(
//     selectSocietyPageDisplayName,
//     selectSocietyPageRoute,
//   ),])
// MenuItemRoutes sideMenuItemRoutes = [
// MenuItem(
//   selectSocietyPageDisplayName,
//   selectSocietyPageRoute, isHidden ?? true
// ),
//   MenuItem(societyHubPageDisplayName, societyHubPageRoute),
//   MenuItem(societyEventsPageDisplayName, societyEventsPageRoute),
//   MenuItem(statisticsPageDisplayName, statisticsPageRoute),
//   MenuItem(editModePageDisplayName, editModePageRoute),
//   MenuItem(editSocietyMembersPageDisplayName, editSocietyMembersPageRoute)
// ];

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(selectSocietyPageDisplayName, selectSocietyPageRoute, false),
  MenuItem(societyHubPageDisplayName, societyHubPageRoute, false),
  MenuItem(societyEventsPageDisplayName, societyEventsPageRoute, false),
  MenuItem(statisticsPageDisplayName, statisticsPageRoute, false),
  MenuItem(editModePageDisplayName, editModePageRoute, false),
  MenuItem(
      editSocietyMembersPageDisplayName, editSocietyMembersPageRoute, false)
];
