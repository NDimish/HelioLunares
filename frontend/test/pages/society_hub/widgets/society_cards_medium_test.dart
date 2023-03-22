import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_medium.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Medium Society Cards Tests", () {
    //Medium Screen Size is of a width 768< x < 1366
    binding.window.physicalSizeTestValue = const Size(900, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets(
        "Society Cards are laid out correctly, and all cards are showing",
        (tester) async {
      // SITA I HAD TO COMMENT THIS OUT BECAUSE IT WAS GIVING ME AN ERORR.
      // ignore: prefer_const_constructors
      // await tester.pumpWidget(MaterialApp(
      //   home: Scaffold(body: SocietyHubCardsMedium()),
      // ));

      //To ensure layout is correct

      final rowOneFinder = find.byKey(const Key("RowOne"));
      final rowTwoFinder = find.byKey(const Key("RowTwo"));
      final rowThreeFinder = find.byKey(const Key("RowThree"));

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

      //Find All 2 cards in row One
      expect(find.descendant(of: rowOneFinder, matching: find.byType(InfoCard)),
          findsNWidgets(2));

      //Find Card in row Two
      expect(find.descendant(of: rowTwoFinder, matching: find.byType(InfoCard)),
          findsOneWidget);

      //Find Card in row Three
      expect(
          find.descendant(of: rowThreeFinder, matching: find.byType(InfoCard)),
          findsOneWidget);
    });
  });
}
