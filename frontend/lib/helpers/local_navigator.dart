import 'package:flutter/widgets.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/routing/router.dart';
import 'package:university_ticketing_system/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: "",
      onGenerateRoute: generateRoute,
    );
