import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/widgets/IndividualPageHeader.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/IndividualSocietyPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

void main() {
  int numTest = 0;
  group("Society Button Test", () {
    testWidgets("Individual Header field renders correct info", (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: IndividualPageHeader(
        headerIcon: Icon(Icons.abc),
        headerName: 'HeaderTest',
      ))));

      final headerFinder = find.text("HeaderTest");
      expect(headerFinder, findsOneWidget);
      expect(find.byIcon(Icons.abc), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}
