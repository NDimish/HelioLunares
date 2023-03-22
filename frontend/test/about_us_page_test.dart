import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:university_ticketing_system/home/homepage.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_card.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_screen.dart';
import 'package:university_ticketing_system/home/ticket_animation.dart';

void main() {
  setUpAll(() => {HttpOverrides.global = null});
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh & Israfeel about us page tests", () {
    testWidgets(
        "About us page renders correctly and displays grid on large screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: DiscoverScreen())));

      expect(find.byType(ListView), findsNothing);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(AboutCard), findsNWidgets(9));

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets(
        "About us page renders correctly and displays list on small screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(500, 800);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: DiscoverScreen())));

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(GridView), findsNothing);

      await tester.pump(const Duration(seconds: 1));
    });
  });
}
