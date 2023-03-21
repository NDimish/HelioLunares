import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_footer.dart';

//These tests were designed for the footer in the old startup screen, which we decided
//to discard in the responsive version.
void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh Startup Footer Tests", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;
    testWidgets('Footer renders correct information', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: Footer(),
      )));

      final footerFinder = find.byType(Footer);
      expect(footerFinder, findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byKey(const Key("footerText")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
    //TODO: Figure out ways of mocking external URL calls
    testWidgets("Footer button displays license", (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: Footer(),
      )));

      final footerFinder = find.byType(Footer);
      final licenseFinder = find.byKey(const Key("footerLicense"));
      expect(footerFinder, findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byKey(const Key("footerText")), findsOneWidget);
      expect(licenseFinder, findsOneWidget);

      await tester.tap(licenseFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(AboutDialog).hitTestable(), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 10));
    });
  });
}
