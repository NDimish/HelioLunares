import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/IndividualSocietyPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

void main() {
  int numTest = 0;
  group("Society Button Test", () {
    testWidgets(
        "Society Button renders correctly and applies correct function on press",
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: SocietyButton(
                  buttonText: "SocietyButtonTest",
                  onPressed: (() {
                    numTest++;
                  })))));

      final buttonFinder = find.text("SocietyButtonTest");
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);

      expect(numTest, equals(1));
      await tester.tap(buttonFinder);
      await tester.tap(buttonFinder);
      expect(numTest, equals(3));

      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}
