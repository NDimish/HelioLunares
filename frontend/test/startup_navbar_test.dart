import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_navbar.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group("Josh Startup Navbar tests", () {
    int testIndex = 0;

    mockSubpageCallback(i) {
      testIndex = i;
    }

    testWidgets("Navbar renders correct named buttons", (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: StartupNavbar(
                  callback: (i) => mockSubpageCallback(i),
                  selectedIndex: testIndex))));

      expect(find.byType(StartupNavbar), findsOneWidget);
      expect(find.text("About"), findsOneWidget);
      expect(find.text("How to use"), findsOneWidget);
      expect(find.text("Contact"), findsOneWidget);
      expect(find.text("Log in"), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets("Navbar buttons correctly change index", (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: StartupNavbar(
                  callback: (i) => mockSubpageCallback(i),
                  selectedIndex: testIndex))));

      expect(find.byType(StartupNavbar), findsOneWidget);
      await tester.tap(find.byKey(const Key("About")));
      await tester.pumpAndSettle();
      expect(testIndex, equals(1));

      await tester.tap(find.byKey(const Key("How to use")));
      await tester.pumpAndSettle();
      expect(testIndex, equals(2));

      await tester.tap(find.byKey(const Key("Contact")));
      await tester.pumpAndSettle();
      expect(testIndex, equals(3));

      await tester.tap(find.byKey(const Key("navbarTitle")));
      await tester.pumpAndSettle();
      expect(testIndex, equals(0));

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets("Navbar title does not appear on small screen", (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: StartupNavbar(
                  callback: (i) => mockSubpageCallback(i),
                  selectedIndex: testIndex))));

      expect(find.text("University Ticketing System"), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
