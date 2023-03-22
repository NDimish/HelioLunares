import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card_small.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Small Info Card Tests", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets("SmallInfoCard Displays correct values & detects tap",
        (tester) async {
      String log = "";
      onTap() {
        log = "On Tap Pressed";
      }

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: InfoCardSmall(
          title: "Title",
          onTap: onTap,
          value: "Test Value",
        )),
      ));

      final infoCardFinder = find.byType(InkWell);
      final titleFinder = find.text("Title");
      final valueFinder = find.text("Test Value");

      expect(infoCardFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(valueFinder, findsOneWidget);

      await tester.tap(infoCardFinder, pointer: 1);
      await tester.pumpAndSettle();

      expect(log, equals("On Tap Pressed"));

      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
