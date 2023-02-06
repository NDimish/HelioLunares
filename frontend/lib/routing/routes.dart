const rootRoute = "/";

const societyHubPageDisplayName = "Profile";
const societyHubPageRoute = "/society_hub";

const societyEventsPageDisplayName = "Events";
const societyEventsPageRoute = "/society_events";

const statisticsPageDisplayName = "Statistics";
const statisticsPageRoute = "/statistics";

const editModePageDisplayName = "Edit Page";
const editModePageRoute = "/edit_mode";

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
];
