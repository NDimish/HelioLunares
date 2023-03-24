import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:university_ticketing_system/widgets/top_nav_bar.dart';
import 'package:university_ticketing_system/backend_communication/models/Society.dart';
import 'package:university_ticketing_system/backend_communication/models/User.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import 'package:university_ticketing_system/backend_communication/models/University.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  User user =
      User(email: "test@gmail.com", userType: 2, date_joined: "12/02/20");

  University university = University(
      name: "KCL",
      latitude: 0.0,
      longitude: 0.0,
      street_name: "test street",
      postcode: "postcode");
  Society society = Society(
      created_at: '12/02/20',
      description: "test description",
      image: "img",
      join_date: "12/02/20",
      name: "Test Society",
      university: university,
      user: user);

  group("TopNavBar test", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets("NavBar is shown correctly", (tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: topNavBar(context, GlobalKey<ScaffoldState>(), false),
                body: Container(),
              );
            },
          ),
        ),
      );
      //To ensure layout is correct
      //  final logoutButtonFinder = find.by

      final logOutFinder = find.byKey(const Key("LogoutButton"));
      final userHubFinder = find.byKey(const Key("UserHubButton"));
      final titleFinder = find.text("Ticket App");

      await tester.pumpAndSettle();
      expect(logOutFinder, findsOneWidget);
      expect(userHubFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets("Back to user hub", (tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: topNavBar(context, GlobalKey<ScaffoldState>(), true),
                body: Container(),
              );
            },
          ),
          routes: {
            '/userhub': (context) => UserHubPage_events(),
          },
        ),
      );
      //To ensure layout is correct
      //  final logoutButtonFinder = find.by

      final logOutFinder = find.byKey(const Key("LogoutButton"));
      final userHubFinder = find.byKey(const Key("UserHubButton"));
      final titleFinder = find.text("Ticket App");
      // final settingsFinder = find.byKey(const Key("SocietySettingsButton"));

      await tester.pumpAndSettle();
      expect(logOutFinder, findsOneWidget);
      expect(userHubFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
      //expect(settingsFinder, findsOneWidget);

      //Simulate back button press
      await tester.tap(userHubFinder);

      await tester.pumpAndSettle();
      expect(userHubFinder, findsNothing);
    });
  });
}
