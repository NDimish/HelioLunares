import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card_small.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_small.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Small Society Cards Tests", () {
    //Medium Screen Size is of a width < 768
    binding.window.physicalSizeTestValue = const Size(500, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets(
        "Society Cards are laid out correctly, and all cards are showing",
        (tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ListView(children: [SocietyHubCardsSmall()])),
      ));

      //To ensure layout is correct

      final columnFinder = find.byType(Column);
      //To ensure all cards are showing
      final eventCountFinder = find.text("Event Count");
      final followerCountFinder = find.text("Follower Count");
      final universityNameFinder = find.text("University");
      final aboutUsFinder = find.text("About Us");

      await tester.pumpAndSettle();
      expect(eventCountFinder, findsOneWidget);
      expect(followerCountFinder, findsOneWidget);
      expect(universityNameFinder, findsOneWidget);
      expect(aboutUsFinder, findsOneWidget);

      //Find All 4 cards in one column
      expect(
          find.descendant(
              of: columnFinder, matching: find.byType(InfoCardSmall)),
          findsNWidgets(4));
    });
  });
}
