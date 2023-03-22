import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:university_ticketing_system/home/homepage.dart';
import 'package:university_ticketing_system/home/ticket_animation.dart';

void main() {
  setUpAll(() => {HttpOverrides.global = null});
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh & Israfeel homepage tests", () {
    testWidgets("Home page renders correctly on small screens", (tester) async {
      binding.window.physicalSizeTestValue = const Size(400, 600);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: HomePage())));

      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.byType(AnimatedBackground), findsOneWidget);

      //On a small screen, you should not see the 'card title', so card should not be present.
      expect(find.byKey(const Key("HomepageCard")).hitTestable(), findsNothing);
      expect(
          find.byKey(const Key("HomepageCol")).hitTestable(), findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets("Home page renders correctly on larger screens",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1000, 600);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: HomePage())));

      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.byType(AnimatedBackground), findsOneWidget);

      //However, on a larger screen, we expect a card to display in the centre.
      expect(
          find.byKey(const Key("HomepageCard")).hitTestable(), findsOneWidget);
      expect(find.byKey(const Key("HomepageCol")).hitTestable(), findsNothing);

      await tester.pump(const Duration(seconds: 1));
    });
  });
}
