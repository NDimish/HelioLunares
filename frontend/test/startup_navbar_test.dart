import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/home/homepage_screens/about_the_app/about_app.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_screen.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:mockito/mockito.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => {HttpOverrides.global = null});
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

    testWidgets("Navbar buttons change properties on hover", (tester) async {
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
      final aboutUsFinder = find.text("About us").hitTestable();
      final aboutAppFinder = find.text("About the app").hitTestable();
      final contactFinder = find.text("Contact Us").hitTestable();
      final signUpFinder = find.text("Sign Up").hitTestable();
      final loginFinder = find.text("Log In").hitTestable();

      expect(find.text("University Ticketing System").hitTestable(),
          findsOneWidget);
      //Discover button has additional navigators, which are invisible until clicked on.
      expect(discoverFinder, findsOneWidget);
      expect(aboutUsFinder, findsNothing);
      expect(aboutAppFinder, findsNothing);
      expect(contactFinder, findsOneWidget);
      expect(signUpFinder, findsOneWidget);
      expect(loginFinder, findsOneWidget);

      //The button which is hovered over gets their TextStyle modified to a different
      //colour while those which are not hovered remain black.
      final hover = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await hover.addPointer(location: Offset.zero);
      addTearDown(hover.removePointer);
      await tester.pumpAndSettle();
      await hover.moveTo(tester.getCenter(contactFinder));
      await tester.pumpAndSettle();

      Text contactHoverFinder =
          find.text("Contact Us").evaluate().single.widget as Text;

      expect(contactHoverFinder.style!.color, Colors.deepPurple);

      await tester.pumpAndSettle();
      await hover.moveTo(tester.getCenter(loginFinder));
      await tester.pumpAndSettle();
      Text loginHoverFinder =
          find.text("Log In").evaluate().single.widget as Text;

      expect(loginHoverFinder.style!.color, Colors.deepPurple);

      await tester.pumpAndSettle();
      await hover.moveTo(tester.getCenter(signUpFinder));
      await tester.pumpAndSettle();

      Text signUpHoverFinder =
          find.text("Sign Up").evaluate().single.widget as Text;

//Find the previous widgets again to verify that their properties have changed when not hovered.
      contactHoverFinder =
          find.text("Contact Us").evaluate().single.widget as Text;

      loginHoverFinder = find.text("Log In").evaluate().single.widget as Text;

      expect(signUpHoverFinder.style!.color, Colors.deepPurple);
      expect(signUpHoverFinder.style!.decoration, TextDecoration.underline);

      expect(contactHoverFinder.style!.color, Colors.black);
      expect(contactHoverFinder.style!.decoration, null);

      expect(loginHoverFinder.style!.color, Colors.black);
      expect(loginHoverFinder.style!.decoration, null);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
