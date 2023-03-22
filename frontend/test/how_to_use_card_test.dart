import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_ticketing_system/home/homepage_screens/about_the_app/about_app_card.dart';

void main() {
  setUpAll(() => {HttpOverrides.global = null});

  group("Josh How to use Card test", () {
    testWidgets(
        'How to use card renders correct information and correctly increments',
        (tester) async {
      //Go through all the cards in order, testing that the index is indeed what is expected.
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: HowToUseCard(steps: [
        "First step",
        "Second step",
        "Third step"
      ], imagesToShow: [
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
      ]))));

      final htuFinder = find.byType(HowToUseCard);
      final leftArrow = find.byKey(const Key("htuLeft"));
      final rightArrow = find.byKey(const Key("htuRight"));

      expect(htuFinder, findsOneWidget);
      expect(leftArrow, findsOneWidget);
      //When a button is disabled, its onPressed attribute should be null
      //Left button should be disabled so user cannot break boundaries.
      expect(tester.widget<IconButton>(leftArrow).onPressed, isNull);
      expect(tester.widget<IconButton>(rightArrow).onPressed, isNotNull);
      expect(rightArrow, findsOneWidget);
      expect(find.text("1 / 3").hitTestable(), findsOneWidget);
      expect(find.byType(Image).hitTestable(), findsOneWidget);

      await tester.tap(rightArrow);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(tester.widget<IconButton>(leftArrow).onPressed, isNotNull);
      expect(tester.widget<IconButton>(rightArrow).onPressed, isNotNull);
      expect(rightArrow, findsOneWidget);
      expect(find.text("2 / 3").hitTestable(), findsOneWidget);
      expect(find.text("1 / 3"), findsNothing);
      expect(find.byType(Image).hitTestable(), findsOneWidget);

      await tester.tap(rightArrow);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(tester.widget<IconButton>(leftArrow).onPressed, isNotNull);
      expect(tester.widget<IconButton>(rightArrow).onPressed, isNull);
      expect(rightArrow, findsOneWidget);
      expect(find.text("3 / 3").hitTestable(), findsOneWidget);
      expect(find.text("2 / 3"), findsNothing);
      expect(find.byType(Image).hitTestable(), findsOneWidget);

      await tester.tap(leftArrow);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(tester.widget<IconButton>(leftArrow).onPressed, isNotNull);
      expect(tester.widget<IconButton>(rightArrow).onPressed, isNotNull);
      expect(rightArrow, findsOneWidget);
      expect(find.text("2 / 3").hitTestable(), findsOneWidget);
      expect(find.text("1 / 3"), findsNothing);
      expect(find.byType(Image).hitTestable(), findsOneWidget);

      await tester.tap(leftArrow);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(tester.widget<IconButton>(leftArrow).onPressed, isNull);
      expect(tester.widget<IconButton>(rightArrow).onPressed, isNotNull);
      expect(rightArrow, findsOneWidget);
      expect(find.text("1 / 3").hitTestable(), findsOneWidget);
      expect(find.byType(Image).hitTestable(), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
