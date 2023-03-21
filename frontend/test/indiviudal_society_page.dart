import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/widgets/IndividualPageHeader.dart';

import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/IndividualSocietyPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

void main() {
  testWidgets('MainSocietyPage displays the correct information', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MainSocietyPage(
        societyName: 'Test Society',
        societyDescription: 'This is a test society.',
        societyUni: 'Test University',
        numberOfFollowers: '10',
        socId: 1,
      ),
    ));

    // Verify that the society name is displayed
    expect(find.text('Test Society'), findsOneWidget);

    // Verify that the society description is displayed
    expect(find.text('This is a test society.'), findsOneWidget);

    // Verify that the university name is displayed
    expect(find.text('Test University'), findsOneWidget);

    // Verify that the number of followers is displayed
    expect(find.text('10'), findsOneWidget);

    // Tap the join/leave button and verify that the dialog appears
    await tester.tap(find.byType(SocietyButton));
    await tester.pumpAndSettle();
    expect(find.text('You have joined successfully!'), findsOneWidget);
  });
}

