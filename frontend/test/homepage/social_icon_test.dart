import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/social_icons.dart';

//These tests were designed for the social icons in the old startup screen, which we decided
//to discard in the responsive version.
void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh Social Icon Tests", () {
    testWidgets('Social Button renders correct icon', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: SocialIcon(
            icon: Icon(FontAwesomeIcons.googlePlay),
            url: "https://www.google.com/",
            tooltip: "Test icon"),
      )));

      final iconFinder = find.byIcon(FontAwesomeIcons.googlePlay);
      expect(iconFinder, findsOneWidget);
      expect(find.byType(SocialIcon), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Social Button displays correct tooltip on hover',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: SocialIcon(
            icon: Icon(FontAwesomeIcons.googlePlay),
            url: "https://www.google.com/",
            tooltip: "Test icon"),
      )));

      final iconFinder = find.byIcon(FontAwesomeIcons.googlePlay);
      expect(iconFinder, findsOneWidget);
      expect(find.byType(SocialIcon), findsOneWidget);

      //Mimic a 'hover' gesture on the button to show tooltip.
      final hover = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await hover.addPointer(location: Offset.zero);
      addTearDown(hover.removePointer);
      await tester.pumpAndSettle();
      await hover.moveTo(tester.getCenter(iconFinder));
      await tester.pumpAndSettle();

      expect(find.text("Test icon"), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 10));
    });
  });
}
