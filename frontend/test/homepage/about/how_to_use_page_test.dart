import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:university_ticketing_system/home/homepage_screens/about_the_app/about_app.dart';

import 'package:university_ticketing_system/submit_button.dart';

void main() {
  setUpAll(() => {HttpOverrides.global = null});
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh & Israfeel how to use page tests", () {
    testWidgets("How to use page renders correctly", (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: HowToUseSection())));

      expect(find.text("Students"), findsOneWidget);
      expect(find.text("Societies"), findsOneWidget);
      expect(find.byType(SubmitButton), findsNWidgets(2));
      expect(find.byKey(const Key("Stuhtu")).hitTestable(), findsOneWidget);
      expect(find.byKey(const Key("Sochtu")).hitTestable(), findsNothing);

      await tester.tap(find.byKey(const Key("SocSubmit")));

      await tester.pump(const Duration(seconds: 5));

      expect(find.byKey(const Key("Stuhtu")), findsNothing);
      expect(find.byKey(const Key("Sochtu")).hitTestable(), findsOneWidget);

      await tester.tap(find.byKey(const Key("StuSubmit")));

      await tester.pump(const Duration(seconds: 5));

      expect(find.byKey(const Key("Stuhtu")).hitTestable(), findsOneWidget);
      expect(find.byKey(const Key("Sochtu")).hitTestable(), findsNothing);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets("How to use page renders correctly on small screens",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(500, 800);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: HowToUseSection())));

      expect(find.text("Students"), findsOneWidget);
      expect(find.text("Societies"), findsOneWidget);
      expect(find.byType(SubmitButton), findsNWidgets(2));
      expect(find.byKey(const Key("Stuhtu")).hitTestable(), findsOneWidget);
      expect(find.byKey(const Key("Sochtu")).hitTestable(), findsNothing);

      await tester.pump(const Duration(seconds: 1));
    });
  });
}
