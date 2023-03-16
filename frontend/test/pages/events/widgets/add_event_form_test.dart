import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:university_ticketing_system/pages/events/widgets/add_event_form.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Add Event Form Tests", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;
    testWidgets('Add Event Form renders correct fields and saveButton',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: AddEventForm(),
        ),
      ));

      //Add event form should have 6 fields as well as save button
      final textFormFieldFinder = find.byType(TextFormField);
      final saveButtonFinder = find.byType(TextButton);

      expect(textFormFieldFinder, findsNWidgets(6));
      expect(saveButtonFinder, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets(
        "Given AddEventForm has empty inputs, then form should not save",
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: AddEventForm(),
        ),
      ));

      final saveButtonFieldFinder = find.byType(TextButton);
      final eventName = find.byKey(const Key("EventName"));
      final eventPrice = find.byKey(const Key("EventPrice"));
      final eventDate = find.byKey(const Key("EventDate"));
      final eventLocation = find.byKey(const Key("EventLocation"));
      final eventDuration = find.byKey(const Key("EventDuration"));
      final eventDescription = find.byKey(const Key("EventDescription"));

      expect(saveButtonFieldFinder, findsOneWidget);
      expect(eventName, findsOneWidget);
      expect(eventPrice, findsOneWidget);
      expect(eventDate, findsOneWidget);
      expect(eventLocation, findsOneWidget);
      expect(eventDuration, findsOneWidget);
      expect(eventDescription, findsOneWidget);

      await tester.tap(saveButtonFieldFinder);
      await tester.pumpAndSettle();

      expect(find.text('Name Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Price Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Date Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Location Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Duration Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Description Can\'t Be Empty'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets(
        "Given AddEventForm has a valid name provided, then form should not save, only error messages for empty fields should display",
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: AddEventForm(),
        ),
      ));

      final saveButtonFieldFinder = find.byType(TextButton);
      final eventName = find.byKey(const Key("EventName"));
      final eventPrice = find.byKey(const Key("EventPrice"));
      final eventDate = find.byKey(const Key("EventDate"));
      final eventLocation = find.byKey(const Key("EventLocation"));
      final eventDuration = find.byKey(const Key("EventDuration"));
      final eventDescription = find.byKey(const Key("EventDescription"));

      expect(saveButtonFieldFinder, findsOneWidget);
      expect(eventName, findsOneWidget);
      expect(eventPrice, findsOneWidget);
      expect(eventDate, findsOneWidget);
      expect(eventLocation, findsOneWidget);
      expect(eventDuration, findsOneWidget);
      expect(eventDescription, findsOneWidget);

      await tester.enterText(eventName, "Event One");
      await tester.enterText(eventPrice, "string input");
      await tester.tap(saveButtonFieldFinder);
      await tester.pumpAndSettle();

      expect(find.text('Name Can\'t Be Empty'), findsNothing);
      expect(find.text('Price Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Date Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Location Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Duration Can\'t Be Empty'), findsOneWidget);
      expect(find.text('Description Can\'t Be Empty'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });

  testWidgets(
      "Given AddEventForm has a price of 0.00, then form should not save, error messages for empty price should display",
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AddEventForm(),
      ),
    ));

    final saveButtonFieldFinder = find.byType(TextButton);
    final eventName = find.byKey(const Key("EventName"));
    final eventPrice = find.byKey(const Key("EventPrice"));
    final eventDate = find.byKey(const Key("EventDate"));
    final eventLocation = find.byKey(const Key("EventLocation"));
    final eventDuration = find.byKey(const Key("EventDuration"));
    final eventDescription = find.byKey(const Key("EventDescription"));

    expect(saveButtonFieldFinder, findsOneWidget);
    expect(eventName, findsOneWidget);
    expect(eventPrice, findsOneWidget);
    expect(eventDate, findsOneWidget);
    expect(eventLocation, findsOneWidget);
    expect(eventDuration, findsOneWidget);
    expect(eventDescription, findsOneWidget);

    await tester.enterText(eventName, "Event One");
    await tester.enterText(eventPrice, "0.00");
    await tester.enterText(eventLocation, "Bush House");
    await tester.enterText(eventDuration, "50");
    await tester.enterText(eventDescription, "This is the event description");
    await tester.tap(saveButtonFieldFinder);
    await tester.pumpAndSettle();

    expect(find.text('Name Can\'t Be Empty'), findsNothing);
    expect(find.text('Price Can\'t Be Empty'), findsOneWidget);
    expect(find.text('Date Can\'t Be Empty'), findsOneWidget);
    expect(find.text('Location Can\'t Be Empty'), findsNothing);
    expect(find.text('Duration Can\'t Be Empty'), findsNothing);
    expect(find.text('Description Can\'t Be Empty'), findsNothing);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  });

  testWidgets(
      "Given AddEventForm has a duration of 0, then form should not save, error messages for empty price should display",
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AddEventForm(),
      ),
    ));

    final saveButtonFieldFinder = find.byType(TextButton);
    final eventName = find.byKey(const Key("EventName"));
    final eventPrice = find.byKey(const Key("EventPrice"));
    final eventDate = find.byKey(const Key("EventDate"));
    final eventLocation = find.byKey(const Key("EventLocation"));
    final eventDuration = find.byKey(const Key("EventDuration"));
    final eventDescription = find.byKey(const Key("EventDescription"));

    expect(saveButtonFieldFinder, findsOneWidget);
    expect(eventName, findsOneWidget);
    expect(eventPrice, findsOneWidget);
    expect(eventDate, findsOneWidget);
    expect(eventLocation, findsOneWidget);
    expect(eventDuration, findsOneWidget);
    expect(eventDescription, findsOneWidget);

    await tester.enterText(eventName, "Event One");
    await tester.enterText(eventPrice, "3");
    await tester.enterText(eventLocation, "Bush House");
    await tester.enterText(eventDuration, "0");
    await tester.enterText(eventDescription, "This is the event description");
    await tester.tap(saveButtonFieldFinder);
    await tester.pumpAndSettle();

    expect(find.text('Name Can\'t Be Empty'), findsNothing);
    expect(find.text('Price Can\'t Be Empty'), findsNothing);
    expect(find.text('Date Can\'t Be Empty'), findsOneWidget);
    expect(find.text('Location Can\'t Be Empty'), findsNothing);
    expect(find.text('Duration Can\'t Be Empty'), findsOneWidget);
    expect(find.text('Description Can\'t Be Empty'), findsNothing);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}
