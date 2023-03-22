import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_card.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => {HttpOverrides.global = null});

  group("Josh Animated About card Tests", () {
    testWidgets('Front side of about card renders correct image',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: AboutCard(
          devName: "Josh Susak",
          roles: [
            "Front-end dev",
            "Back-end dev",
          ],
          imagePath: "https://avatars.githubusercontent.com/u/114754624?v=4",
          githubLink: "https://github.com/JSusak",
          secondaryIcon: Icons.web,
          secondaryLink: "https://www.google.com/",
          cardSize: 300,
        ),
      )));

      //The front side of the card should simply contain an image to show to the user.
      //Any further info should not be present unless the user chooses to hover over it.
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);
      expect(find.byType(Text).hitTestable(), findsNothing);
      expect(find.byType(Icon).hitTestable(), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

//Simulate user hover to view information on the back of the card.
    testWidgets(
        'Back side of card renders correct information on hover and removes divider on small screen',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: AboutCard(
          devName: "Josh Susak",
          roles: [
            "Front-end dev",
            "Back-end dev",
          ],
          imagePath: "https://avatars.githubusercontent.com/u/114754624?v=4",
          githubLink: "https://github.com/JSusak",
          secondaryIcon: Icons.web,
          secondaryLink: "https://www.google.com/",
          cardSize: 300,
        ),
      )));

      //The front side of the card should simply contain an image to show to the user.
      //Any further info should not be present unless the user chooses to hover over it.
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);
      expect(find.byType(Text).hitTestable(), findsNothing);
      expect(find.byType(Icon).hitTestable(), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final hover = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await hover.addPointer(location: Offset.zero);
      addTearDown(hover.removePointer);
      await tester.pumpAndSettle();
      //Simulate hovering of the card.
      await hover.moveTo(tester.getCenter(find.byType(AboutCard)));
      await tester.pumpAndSettle();

      expect(imageFinder.hitTestable(), findsNothing);
      //Name, project roles and the two roles as a test.
      //On a small screen, the divider is not displayed.
      expect(find.byType(Text).hitTestable(), findsNWidgets(4));
      expect(find.byType(Divider), findsNWidgets(1));
      expect(find.byType(Icon).hitTestable(), findsNWidgets(2));

      await tester.pumpAndSettle(const Duration(seconds: 10));
    });

    testWidgets(
        'Back side of card renders correct information and new divider on hover on large screen',
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: AboutCard(
          devName: "Josh Susak",
          roles: [
            "Front-end dev",
            "Back-end dev",
          ],
          imagePath: "https://avatars.githubusercontent.com/u/114754624?v=4",
          githubLink: "https://github.com/JSusak",
          secondaryIcon: Icons.web,
          secondaryLink: "https://www.google.com/",
          cardSize: 300,
        ),
      )));

      //The front side of the card should simply contain an image to show to the user.
      //Any further info should not be present unless the user chooses to hover over it.
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);
      expect(find.byType(Text).hitTestable(), findsNothing);
      expect(find.byType(Icon).hitTestable(), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final hover = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await hover.addPointer(location: Offset.zero);
      addTearDown(hover.removePointer);
      await tester.pumpAndSettle();
      //Simulate hovering of the card.
      await hover.moveTo(tester.getCenter(find.byType(AboutCard)));
      await tester.pumpAndSettle();

      expect(imageFinder.hitTestable(), findsNothing);
      //Name, project roles and the two roles as a test.
      expect(find.byType(Text).hitTestable(), findsNWidgets(4));
      expect(find.byType(Divider), findsNWidgets(2));
      expect(find.byType(Icon).hitTestable(), findsNWidgets(2));

      await tester.pumpAndSettle(const Duration(seconds: 10));
    });
  });
}
