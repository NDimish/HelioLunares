import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:university_ticketing_system/submit_button.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh Submit Button Test", () {
    testWidgets(
        'Submit button renders correctly and produces correct callback result',
        (tester) async {
      int buttonPress = 0;
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: SubmitButton(
          onPressed: () => buttonPress++,
          textIn: "Submit",
          scaleFactor: 1.5,
        ),
      )));

      final submitFinder = find.text("Submit");

      expect(submitFinder, findsOneWidget);
      expect(buttonPress, 0);

      await tester.tap(submitFinder);
      await tester.pump();
      expect(buttonPress, isNot(0));
      expect(buttonPress, 1);

      await tester.tap(submitFinder);
      await tester.pump();

      expect(buttonPress, isNot(0));
      expect(buttonPress, isNot(1));
      expect(buttonPress, 2);

      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
