import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_large.dart';
import 'package:university_ticketing_system/backend_communication/models/Society.dart';
import 'package:university_ticketing_system/backend_communication/models/User.dart';
import 'package:university_ticketing_system/backend_communication/models/University.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  User user = User(
      email: "test@gmail.com",
      userType: 2,
      date_joined: "12/02/20",
      password: "w",
      id: 1);

  University university = University(
      name: "KCL",
      latitude: 0.0,
      longitude: 0.0,
      street_name: "test street",
      postcode: "postcode");
  Society society = Society(
      created_at: '12/02/20',
      description: "test description",
      image: "img",
      join_date: "12/02/20",
      name: "Test Society",
      university: university,
      user: user);

  group("Large Society Cards Tests", () {
    //Large Screen Size is of a width > 1366
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets(
        "Society Cards are laid out correctly, and all cards are showing",
        (tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SocietyHubCardsLarge(
          society: society,
          memberCount: "23",
          eventCount: "3",
        )),
      ));

      //To ensure layout is correct

      final rowOneFinder = find.byKey(const Key("RowOne"));
      final rowTwoFinder = find.byKey(const Key("RowTwo"));

      //To ensure all cards are showing
      final eventCountFinder = find.text("Event Count");
      final followerCountFinder = find.text("Member Count");
      final universityNameFinder = find.text("University");
      final aboutUsFinder = find.text("About Us");

      await tester.pumpAndSettle();
      expect(eventCountFinder, findsOneWidget);
      expect(followerCountFinder, findsOneWidget);
      expect(universityNameFinder, findsOneWidget);
      expect(aboutUsFinder, findsOneWidget);

      //Find All 3 cards in row One
      expect(find.descendant(of: rowOneFinder, matching: find.byType(InfoCard)),
          findsNWidgets(3));

      //Find Card in row Two
      expect(find.descendant(of: rowTwoFinder, matching: find.byType(InfoCard)),
          findsOneWidget);
    });
  });
}
