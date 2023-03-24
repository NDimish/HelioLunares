import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/hero_card.dart';

//These tests were used for the animated hovering card on the old startup page. This is not included
//in the responsive design but is still kept in should you wish to test the old version.
void main() {
  setUpAll(() => {HttpOverrides.global = null});

  group("Josh Animated Hero card Tests", () {
    //This test is very similar to the about card... Both initially display an image to the
    //user while hiding the information until a hover
    testWidgets('Front side of hero card renders correct image',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: HeroCard(
                  key: const Key("heroCard"),
                  headerName: "Test Hero Card",
                  feature: "Test Hero Card feature",
                  imageLink:
                      "https://avatars.githubusercontent.com/u/114754624?v=4"))));

      final imageFinder = find.byKey(const Key("heroCard"));
      expect(imageFinder.hitTestable(), findsOneWidget);
      expect(find.byType(Text).hitTestable(), findsNothing);
      expect(find.byType(Divider).hitTestable(), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Back side of hero card renders correct information on hover',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: HeroCard(
                  key: const Key("heroCard"),
                  headerName: "Test Hero Card",
                  feature: "Test Hero Card feature",
                  imageLink:
                      "https://avatars.githubusercontent.com/u/114754624?v=4"))));

      final imageFinder = find.byKey(const Key("heroCard"));
      expect(imageFinder, findsOneWidget);
      expect(find.byType(Text).hitTestable(), findsNothing);
      expect(find.byType(Icon).hitTestable(), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final hover = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await hover.addPointer(location: Offset.zero);
      addTearDown(hover.removePointer);
      await tester.pumpAndSettle();
      await hover.moveTo(tester.getCenter(find.byType(HeroCard)));
      await tester.pumpAndSettle();

      //Header, feature and image should be present - as opposed to the about card,
      //the hero card overlays the intial image.
      expect(find.byType(Text).hitTestable(), findsNWidgets(2));
      expect(find.byType(Divider), findsNWidgets(3));
      expect(imageFinder, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 10));
    });
  });
}
