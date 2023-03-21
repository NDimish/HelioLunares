import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:university_ticketing_system/home/topbar.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group("Josh & Israfeel Responsive Navbar tests", () {
    testWidgets("Navbar renders correct content on large screens",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: PreferredSize(
        preferredSize: Size(1920, 1000),
        child: TopBarContents(),
      ))));

      final discoverFinder = find.byType(DiscoverPopupMenu);

      expect(find.text("University Ticketing System").hitTestable(),
          findsOneWidget);
      //Discover button has additional navigators, which are invisible until clicked on.
      expect(discoverFinder, findsOneWidget);
      expect(find.text("About us").hitTestable(), findsNothing);
      expect(find.text("About the app").hitTestable(), findsNothing);
      expect(find.text("Contact Us").hitTestable(), findsOneWidget);
      expect(find.text("Sign Up").hitTestable(), findsOneWidget);
      expect(find.text("Log In").hitTestable(), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets("Navbar renders additional navigators on discover click",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: PreferredSize(
        preferredSize: Size(1920, 1000),
        child: TopBarContents(),
      ))));

      final discoverFinder = find.byType(DiscoverPopupMenu);

      expect(find.text("University Ticketing System").hitTestable(),
          findsOneWidget);
      //Discover button has additional navigators, which are invisible until clicked on.
      expect(discoverFinder, findsOneWidget);
      expect(find.text("About us"), findsNothing);
      expect(find.text("About the app"), findsNothing);

      await tester.tap(discoverFinder);
      await tester.pumpAndSettle();
      expect(discoverFinder, findsOneWidget);
      expect(find.text("About us").hitTestable(), findsOneWidget);
      expect(find.text("About the app").hitTestable(), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
